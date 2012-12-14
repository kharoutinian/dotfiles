#!/usr/bin/env python
#
# A script to download the newest version of vim plugins from github and
# unpack them to the correct directory

import os
import shutil
import subprocess
import sys

git_bundle = [
        'git://github.com/altercation/vim-colors-solarized.git',
        'git://github.com/davidoc/taskpaper.vim.git',
        'git://github.com/ervandew/supertab.git',
        'git://github.com/godlygeek/tabular.git',
        'git://github.com/kevinw/pyflakes-vim.git',
        'git://github.com/msanders/snipmate.vim.git',
        'git://github.com/scrooloose/nerdcommenter.git',
        'git://github.com/scrooloose/nerdtree.git',
        'git://github.com/tclem/vim-arduino.git',
        'git://github.com/tomasr/molokai.git',
        'git://github.com/tpope/vim-fugitive.git',
        'git://github.com/tpope/vim-pathogen.git',
        'git://github.com/tpope/vim-repeat.git',
        'git://github.com/tpope/vim-surround.git',
        'git://github.com/tpope/vim-vividchalk.git',
        'git://github.com/tsaleh/vim-matchit.git',
        'git://github.com/tsaleh/vim-tmux.git',
        'git://github.com/vim-scripts/OmniCppComplete.git',
        'git://github.com/vim-scripts/a.vim.git',
        'git://github.com/vim-scripts/taglist.vim.git',
        'git://github.com/xolox/vim-easytags.git'
]

# TODO: implement integrating other scripts
other_scripts = [
    ['cscope_maps', 'http://cscope.sourceforge.net/cscope_maps.vim']
]


def update_git_repo(clone_path):
    # strip .git from the clone path
    repo_name = os.path.splitext(os.path.basename(clone_path))[0]
    if os.path.exists(repo_name):
        print 'Updating {}'.format(repo_name)
        repo = git.Repo(repo_name)
        repo.remote().pull()
    else:
        print 'Cloning {}'.format(repo_name)
        print subprocess.check_output(['git', 'clone', clone_path])


def main():
    if sys.platform.startswith('win'):
        home = os.getenv('USERPROFILE')
    else:
        home = os.getenv('HOME')
    assert home is not None
    plugin_dir = os.path.join(home, '.vim')
    assert os.path.exists(plugin_dir)
    bundle = os.path.join(plugin_dir, 'bundle')
    if not os.path.exists(bundle):
        os.mkdir(bundle)

    os.chdir(bundle)
    for url in git_bundle:
        update_git_repo(url)

    print 'Updating Pathogen'
    shutil.rmtree(os.path.join(plugin_dir, 'autoload'))
    shutil.copytree(
            os.path.join(plugin_dir, 'bundle', 'vim-pathogen', 'autoload'),
            os.path.join(plugin_dir, 'autoload'))

    # Create bakcup/tmp/undo dirs if they don't exist
    if not os.path.exists(os.path.join(plugin_dir, 'backup')):
        os.mkdir(os.path.join(plugin_dir, 'backup'))
    if not os.path.exists(os.path.join(plugin_dir, 'tmp')):
        os.mkdir(os.path.join(plugin_dir, 'tmp'))
    if not os.path.exists(os.path.join(plugin_dir, 'undo')):
        os.mkdir(os.path.join(plugin_dir, 'undo'))

if __name__ == '__main__':
    main()


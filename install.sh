dotfiles="\
.aliases \
.bash_functions \
.bash_history \
.bash_logout \
.bash_profile \
.bashrc \
.gitconfig \
.gitignore_global \
.gvimrc \
.pythonrc \
.vim \
.vimrc \
.Xdefaults \
.Xresources \
.zshrc"

# Install oh-my-zsh
# must be run before .zshrc symlink is created
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

for f in $dotfiles
do
    ln -sf $PWD/$f $HOME/$f
done

pushd $HOME/.vim
mkdir bundle
chmod +x ./update_bundles
./update_bundles
popd

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
    .zshrc\
    "

config_dirs="\
    awesome\
    "

# Install oh-my-zsh
# must be run before .zshrc symlink is created
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

for f in $dotfiles
do
    ln -sf $PWD/$f $HOME/$f
done

for f in $config_dirs
do
    ln -sf $PWD/$f $HOME/.config/$f
done


pushd $HOME/.vim
mkdir bundle
chmod +x ./update_bundles
./update_bundles
popd

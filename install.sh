configfiles="\
.bash_aliases \
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
.Xresources"

for f in $configfiles
do
    echo "ln -sf $PWD/$f $HOME/$f"
done

pushd $HOME/.vim
chmod +x ./update_bundles
./update_bundles
popd

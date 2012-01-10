extract() {
  local e=0 i c
  for i; do
    if [[ -r $i ]]; then
        c=''
        case $i in
          *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                 c='bsdtar xvf' ;;
          *.7z)  c='7z x'       ;;
          *.Z)   c='uncompress' ;;
          *.bz2) c='bunzip2'    ;;
          *.exe) c='cabextract' ;;
          *.gz)  c='gunzip'     ;;
          *.rar) c='unrar x'    ;;
          *.xz)  c='unxz'       ;;
          *.zip) c='unzip'      ;;
          *)     echo "$0: cannot extract \`$i': Unrecognized file extension" >&2; e=1 ;;
        esac
        [[ $c ]] && command $c "$i"
    else
        echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
    fi
  done
  return $e
}

function env() {
  exec /usr/bin/env "$@" | grep -v ^LESS_TERMCAP_
}

newgit() {
  if [ -z $1 ]; then
    echo "usage: $FUNCNAME project-name.git"
  else
    gitdir="/home/$USER/$PATH/$1"
    mkdir $gitdir
    pushd $gitdir
    git --bare init
    git --bare update-server-info
    chmod a+x hooks/post-update
    touch git-daemon-export-ok
    popd
  fi
}

function mntiso() {

  if [ ! -f $1 ]; then
    echo "usage: $FUNCNAME path_to_img.iso"
  else
    mntdir=/media/iso
    if [ ! -d $mntdir ]; then
      sudo mkdir -p $mntdir
    fi
    sudo mount -o loop -t auto $1 $mntdir
  fi
}

function clone235() {
    cd ~/Dropbox/school/235/submit/
    if [ -n $1 ]; then
        git clone metastasis@cancer.cs.ucdavis.edu:user/kkharoutinian/1/$1
    fi
    cd -
}

function startapp() {
    if [ $# -ne 0 ]; then
        CMD=$*
        echo $CMD
        pidof $CMD >& /dev/null
        if [ $? -ne 0 ]; then
            $CMD &
        fi
    fi
}

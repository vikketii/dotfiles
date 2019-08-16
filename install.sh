#!/bin/bash

CMD="$1"
dotfilesdir=$(pwd)
backupdir=~/.dotfiles.orig
dotfiles=(.bash_aliases .bashrc .vimrc .Xresources)
dotfiles_config=(.compton .i3 .i3status .rofi .zathura .polybar)


printusage() {
    prog=$(basename "$0")
    echo "Usage: $prog [-option]" >&2
    echo "" >&2
    echo "Options:" >&2
    echo "  --help        Print this message" >&2
    echo "  -p            Install all packages" >&2
    echo "  -c            Install all config" >&2
}


install_packages() {
    pacman -S --needed - < "$dotfilesdir/packages/pkglist"
}


install_configs() {
    # Backup configs
    if ! [ -f $backupdir/check-backup.txt ]; then
        mkdir -p $backupdir/.config
        cd $backupdir
        touch check-backup.txt

        # Backup to ~/.dotfiles.orig
        for dots in "${dotfiles[@]}"
        do
            /bin/cp -rf ~/${dots} $backupdir &> /dev/null
        done

        # Backup dotfiles_config to ~/.dotfiles.orig/.config
        for dots_conf in "${dotfiles_config[@]//./}"
        do
            /bin/cp -rf ~/.config/${dots_conf} $backupdir/.config &> /dev/null
        done

        # Output
        echo -e "Your config is backed up in "$backupdir"\n" >&2
        echo -e "Please do not delete check-backup.txt in .dotfiles.orig folder." >&2
        echo -e "It's used to backup and restore your old config.\n" >&2
    fi

    # Install dotfiles to ~
    for dots in "${dotfiles[@]}"
    do
        /bin/rm -rf ~/${dots}
        /bin/ln -fs "$dotfilesdir/${dots}" ~/
    done

    # Install dotfiles_config to ~/.config
    mkdir -p ~/.config
    for dots_conf in "${dotfiles_config[@]}"
    do
        /bin/rm -rf ~/.config/${dots_conf[@]//./}
        /bin/ln -fs "$dotfilesdir/${dots_conf}" ~/.config/${dots_conf[@]//./}
    done

    echo -e "New dotfiles are installed!\n" >&2
    #echo -e "To restore old config, you can use './install.sh -r' command." >&2
}


if [[ -z "$1" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    printusage
    exit 0
fi


case "$CMD" in
    -c)
        read -p "Install configs? y/n " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            install_configs
        fi
        ;;
    -p)
        read -p "Install packages? y/n " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            install_packages
        fi
        ;;
    -r)
        echo "Config restore is not implemented yet :/" >&2
        exit 1
        ;;
    *)
        echo "Command not found" >&2
        exit 1
esac

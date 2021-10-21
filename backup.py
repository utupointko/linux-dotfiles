import subprocess


def run(command):
    return subprocess.call(command, shell=True)


def backup_packages():
    run("pacman -Q | awk '{print $1}' > .other/packages/all_packages.txt")
    run("pacman -Qe | awk '{print $1}' > .other/packages/sys_app_packages.txt")
    run("pacman -Qet | awk '{print $1}' > .other/packages/app_packages.txt")
    run("code --list-extensions > .other/packages/vscode_extensions.txt")


def backup_bin():
    run("cp -r $HOME/.bin .")


def backup_configs():
    run("cp -r $HOME/.i3/* .config/i3")
    run("cp -r $HOME/.config/rofi .config")
    run("cp -r $HOME/.config/fontconfig .config")
    run("dconf dump /com/gexperts/Tilix/ > .config/tilix/config.dconf")
    run("cp $HOME/.config/nvim/init.vim .config/nvim")
    run("cp $HOME/.config/ranger/rifle.conf .config/ranger")
    run("cp $HOME/.config/ranger/scope.sh .config/ranger")
    run("cp $HOME/.config/dunst/dunstrc .config/dunst")
    run("cp $HOME/.config/picom.conf .config/picom")
    run("cp $HOME/.config/gtk-3.0/bookmarks .config/gtk-3.0")
    run("cp $HOME/.ssh/config .config/ssh")
    run("cp $HOME/.zshrc .config/zsh")


if __name__ == "__main__":

    backup_packages()
    backup_bin()
    backup_configs()

    print("\nBackup has finished!\n")

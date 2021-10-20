import subprocess


def run(command):
    return subprocess.call(command, shell=True)


base = "i3-gaps py3status picom rofi ranger tilix noto-fonts-emoji nerd-fonts-terminus ttf-material-design-icons-webfont"
cli = "fzf bmenu bashtop ncdu bat yelp xclip redshift inxi neofetch speedtest-cli timeset blueman wmctrl i3-battery-popup-git xidlehook pulseaudio-bluetooth pa-applet pavucontrol python-nautilus python-pydbus"
gui = "google-chrome nautilus nautilus-empty-file notion-app-nativefier mailspring telegram-desktop discord teams steam-manjaro vlc qbittorrent foxitreader onlyoffice-desktopeditors obs-studio stacer clipit nitrogen"
dev = "visual-studio-code-bin pycharm-professional postman-bin docker docker-compose"

packages = f"{base} {cli} {gui} {dev}"


def install_packages():
    run("yay -S {}".format(packages))


def install_bin():
    run("cp -r .bin $HOME")


def install_configs():
    run("cp -r .config/i3/* $HOME/.i3")
    run("cp -r .config/conky $HOME/.config")
    run("cp -r .config/rofi $HOME/.config")
    run("cp -r .config/mailspring $HOME/.config")
    run("cp -r .config/fontconfig $HOME/.config")
    run("dconf load /com/gexperts/Tilix/ < .config/tilix/config.dconf")
    run("cp .config/picom/picom.conf $HOME/.config")
    run("cp .config/dmenu/.dmenurc $HOME")
    run("cp .config/dunst/dunstrc $HOME/.config/dunst")
    run("cp .config/ranger/rifle.conf $HOME/.config/ranger")
    run("cp .config/ssh/config $HOME/.ssh")
    run("cp .config/gtk-3.0/bookmarks $HOME/.config/gtk-3.0")


def install_grub_theme():
    run("sudo cp -r .other/grub/fallout-grub-theme /boot/grub/themes")
    run("sudo cp -r .other/grub/grub /etc/default")
    run("sudo update-grub")


def install_zsh():
    run("sudo pacman -S zsh")
    run("sh -c \"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"")
    run("git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting")
    run("git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions")
    run("cp .zshrc $HOME")


def install_nvim():
    run("sudo pacman -S neovim")
    run("sh -c 'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")
    run("cp .vimrc $HOME")


if __name__ == "__main__":

    # install_packages()
    # install_grub_theme()
    # install_zsh()
    # install_nvim()
    # install_bin()
    # install_configs()

    print("\nIntallation has finished!\n")

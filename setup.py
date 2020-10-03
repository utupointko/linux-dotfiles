import subprocess


def run(command):
    return subprocess.call(command, shell=True)


arch_packages = "firefox telegram-desktop discord freeoffice vlc qbittorrent nautilus python-nautilus grub-customizer gucharmap tilix zsh rofi blueman pulseaudio-bluetooth pa-applet pavucontrol neofetch speedtest-cli wmctrl xclip redshift noto-fonts-emoji"
aur_packages = "google-chrome-stable spotify spicetify-cli spotify-tui spotifyd  mailspring teams visual-studio-code-bin clion pycharm-professional intellij-idea-ultimate-edition datagrip i3-battery-popup-git"
vscode_extensions = ["James-Yu.latex-workshop", "fallenwood.vimL", "icrawl.discord-vscode", "ms-python.python", "ms-vscode.cpptools", "ms-vsliveshare.vsliveshare", "ritwickdey.LiveServer", "vscode-icons-team.vscode-icons", "j-james.adapta-nokto-vscode"]


def install_arch_packages():
    run("sudo pacman -S {}".format(arch_packages))


def install_aur_packages():
    run("yay -S {}".format(aur_packages))


def install_vscode_extensions():
    for extension in vscode_extensions:
    	run("code --install-extension {}".format(extension))


def install_oh_my_zsh():
    run("sh -c \"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"")
    run("git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting")
    run("git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions")


def install_vim_plug():
    run("curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")


def fix_time():
    run("sudo timedatectl set-local-rtc 1 --adjust-system-clock")


def install_bin():
    run("cp -r .bin $HOME")


def install_configs():
    run("cp -r .config/conky $HOME/.config")
    run("cp -r .config/fontconfig $HOME/.config")
    run("cp .config/gtk-3.0/bookmarks $HOME/.config/gtk-3.0")
    run("cp -r .config/mailspring $HOME/.config")
    run("cp -r .config/spicetify $HOME/.config")
    run("sudo chmod a+wr /opt/spotify")
    run("sudo chmod a+wr /opt/spotify/Apps -R")
    run("sudo .other/spt/install.sh")
    run("spicetify backup apply enable-devtool")
    run("dconf load /com/gexperts/Tilix/ < .config/tilix/config.dconf")
    run("cp .config/picom/picom.conf $HOME/.config")
    run("cp .config/ranger/rifle.conf $HOME/.config/ranger")
    run("cp .config/dmenu/.dmenurc $HOME")
    run("sudo cp .config/rofi/rofi-sensible-terminal /usr/bin")
    run("cp -r .i3 $HOME")
    run("sudo cp -r .other/fallout-grub-theme /boot/grub/themes")
    run("cp .vimrc $HOME")
    run("cp .zshrc $HOME")

if __name__ == "__main__":

    # install_arch_packages()
    # install_aur_packages()
    # install_vscode_extensions()
    # install_oh_my_zsh()
    # install_vim_plug()
    # fix_time()
    # install_bin()
    # install_configs()

    print("\nIntallation has finished!\n")

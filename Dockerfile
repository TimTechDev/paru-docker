FROM docker.io/archlinux/archlinux:base-devel

RUN useradd -m paru && \
    pacman -Syu --noconfirm && \
    pacman -Sy --noconfirm --asdeps git && \
    echo "paru ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/paru && \
    cd /home/paru && \
    sudo -u paru git clone https://aur.archlinux.org/paru-bin.git && \
    cd /home/paru/paru-bin && \
    sudo -u paru makepkg -si --noconfirm && \
    cd / && \
    rm -fr /home/paru/paru-bin

USER paru
WORKDIR /home/paru

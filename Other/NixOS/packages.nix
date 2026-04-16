{pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    # List packages installed in system profile.
    # You can use https://search.nixos.org/ to find more packages (and options).
    environment.systemPackages = with pkgs; [
        # Package Managers
        wget
        # Fonts
        nerd-fonts.jetbrains-mono
        #Kvantum
        libsForQt5.qtstyleplugin-kvantum
        kdePackages.qtstyleplugin-kvantum
        # Version Control
        git
        # Terminal Tools
        tmux
        yt-dlp
        wl-clipboard
        w3m
        ranger
        # Development Tools
        postman
        cmake
        # Programming Languages
        zig
        python313
        lua
        jdk24
        # Terminals
        ghostty
        wezterm
        # Performance Monitors
        htop
        nvtopPackages.v3d
        btop
        # Cool
        fastfetch
        # Libraries
        libgcc
        # Compilers
        gcc
        # Databases
        mariadb
        mysql84
        # IDE's / Code Editors
        eclipses.eclipse-java
        vscode
        emacs
        vim
        neovim
        # SSH
        openssl
        openssh
        # Shells
        zsh
        # Power Management
        tlp
        # Others
        anydesk
        vlc
        unzip
        xdg-user-dirs
        # KDE
        kdePackages.kdeconnect-kde
        kdePackages.discover
        kdePackages.kcalc
        kdePackages.kcharselect
        kdePackages.kclock
        kdePackages.kcolorchooser
        kdePackages.kolourpaint
        kdePackages.ksystemlog
        kdePackages.sddm-kcm
        kdePackages.isoimagewriter
        kdePackages.partitionmanager
    ];
}

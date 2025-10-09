{ config, pkgs, pkgs-unstable, ... }:

{
 users.users.winter.packages = 
  (with pkgs; [
   ## stable packages
    ## terminal emulator
      alacritty
    ## hyprland specific things
      waybar          #decent bar
      swww            #wallpaper utility
      pywalfox-native #pywal for firefox
      walker          #app launcher
      hyprshot        #screenshot util
      hyprlock        #lock screen utility
      hyprpicker      #needed for --freeze in hyprshot and a colour picker
      rofi    #runs dmenu scripts
      tofi    #app launcher
   ##cli tools
      ##spec fetching utils
          nitch
          btop
        ##other cli tools
          nh              #nixos search utility
            nix-search-tv
            fzf
          python3         #literally just python
          parted          #useful for resizing disks
      #vscodium permission tool ig
        lxqt.lxqt-policykit
      #brightness tool for brightness keys
        brightnessctl
      #samba shares things for my nas
        cifs-utils
        samba
      #notifications
        mako
	libnotify
      #killall command
        killall
      #ark
        kdePackages.ark
      #git
        git
      #Text editors
        vscodium
        vim
    #notes
      obsidian


    ])
   ++
  (with pkgs-unstable; [
  ##wallpaper and themes
    imagemagick
    pywal16
  #clipboard history
    cliphist
    wl-clipboard
  #idle config
    hypridle
  #browser
    librewolf           #personal browser
    firefox 		#school browser
  #file explorer
    kdePackages.dolphin
    lf
  #discord
    vesktop
  #video viewer
    mpv
  #photo tools
    loupe
 #torrent app for legal downloads
    qbittorrent
  #bluetooth tool
    blueberry
  #icon theme
    dracula-icon-theme
  #webapps
    quick-webapps
  #virtualisaton
    gnome-boxes
#    vmware-workstation
]);
}

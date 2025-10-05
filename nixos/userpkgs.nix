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
      walker          #app launcher
      hyprshot        #screenshot util
      hyprlock        #lock screen utility
      hyprpicker      #needed for --freeze in hyprshot and a colour picker
      rofi    #app launcher and script dmenu app
	  ##cli tools
      ##spec fetching utils
          nitch           #search util
          btop		        #shows cpu/gpu/ram usage and list of running applications
        ##other cli tools
          nh              #nixos search utility
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
	      micro
        vim-full
    #notes
      obsidian

    ])
   ++
  (with pkgs-unstable; [
  ##wallpaper and theming utilities
    swww
    pywalfox-native
    imagemagick
    pywal16
  #browser
    librewolf           #personal browser
    firefox 		        #school browser
  #file explorer
    kdePackages.dolphin
    vifm
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
 ]);
}

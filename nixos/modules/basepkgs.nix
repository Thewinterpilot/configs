{ inputs, config, pkgs, pkgs-unstable, username, ... }:




{

  #set up nerdfonts
    fonts.packages = [ 
      pkgs.nerd-fonts.jetbrains-mono 
      pkgs.maple-mono.NF 
    ];

   #ly is a simple, tui display manager with a minimal login screen look
      services.displayManager.ly.enable = true;




 users.users.${username}.packages = 
  (with pkgs; [
    ## terminal
      alacritty
   ##cli tools
        nitch
        btop
        python3
        parted
    ##background things
      lxqt.lxqt-policykit#permission toolkit for vscode
      samba cifs-utils
      killall
      kdePackages.ark
      git
    ##text editors
      vscodium
      vim
      obsidian
    ])
   ++
  (with pkgs-unstable; [


  #browser
    librewolf
  #file explorers
    kdePackages.dolphin
    lf

  #other tools
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

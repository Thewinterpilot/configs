{ config, pkgs, pkgs-unstable, lib, ... }:


{


  #usernames setup
    home.username = "winter";
    home.homeDirectory = "/home/winter";
    home.stateVersion = "25.05";
    programs.home-manager.enable = true;

  

  #bash scripts
    programs.bash = {
      enable = true;
      bashrcExtra = "cat ~/.cache/wal/sequences";
      shellAliases = {
        V = "sudo vim .";
        v = "vim .";
        vv = "vim";
        VV = "sudo vim";
        cl = "clear";
        cn = "clear; nitch";
        c = "codium .";
        cc = "codium";
        rs = "sudo nixos-rebuild switch --impure; bash ~/configs/scripts/update";
        rss = "sudo nixos-rebuild switch --impure";
	up = "bash ~/configs/scripts/update";
        cnx = "codium /etc/nixos/";
        ss = "nh search ";
        upgrade = "sudo nixos-rebuild switch --upgrade --impure";
	hypr = "vim ~/.config/hypr/";
        nd = "cd /etc/nixos/";

    };

  #startup message 
    initExtra = ''
        export PS1='\[\e[3m\]\w\[\e[0m\] >'
      '';
  }; ######THIS IS THE END OF THE PROGRAMS.BASH	SEGMENT

# GTK theming settings
  gtk = {
    enable = true;
    #Icon Theme
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      # package = pkgs.kdePackages.breeze-icons;
      # name = "Breeze-Dark";
    };};

  dconf = {
      enable = true;
    settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };};};

    wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
      hyprtrails
      hyprspace
    ];



 
}


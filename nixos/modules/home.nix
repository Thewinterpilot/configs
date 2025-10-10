{ config, pkgs, pkgs-unstable, lib, username, hostname, ... }:

let
 username = "winter";
in
{


  #usernames setup
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
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
        rs = "sudo nixos-rebuild switch; bash ~/configs/scripts/update";
        rss = "sudo nixos-rebuild switch --impure";
	up = "bash ~/configs/scripts/update";
        cnx = "codium /etc/nixos/";
        ss = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}'";
        upgrade = "sudo nixos-rebuild switch --upgrade --impure";
	hypr = "vim ~/.config/hypr/";
        nd = "lf /etc/nixos/";
        lf = "lf -command 'set hidden!'";
        cf = "bash /home/winter/configs/scripts/confsearch";
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
      };
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
    };};};

    wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
      hyprtrails
      hyprspace
    ];



}

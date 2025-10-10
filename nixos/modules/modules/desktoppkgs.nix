{config, lib, pkgs, pkgs-unstable, username, ... }:

{
services.desktopManager.plasma6.enable = true;

users.users.${username}.packages = with pkgs; [
    waybar
    walker
    gimp
    vim
    nix-search-tv
    fzf
    krita
    git
    prismlauncher
    qbittorrent
    kdePackages.kdenlive
    flameshot
  ];
}

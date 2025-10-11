{ inputs, config, lib, pkgs, pkgs-unstable, username, hostname, ... }:{


programs.hyprland = {
  enable = true;
  xwayland.enable = true;
};

xdg.portal = {
  enable = true;
  extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
};


 users.users.${username}.packages = 
(with pkgs; [
  waybar
  swww
  pywalfox-native
  hyprshot
  hyprlock
  hyprpicker 
  rofi
  tofi 
  hypridle 
  mako
])
  ++
(with pkgs-unstable; [
  cliphist
  wl-clipboard
  imagemagick
]);


}

{ inputs, config, lib, pkgs, pkgs-unstable, username, hostname, ... }:


{ 
  


programs.niri = {
  enable = true;
};
    

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
      };

  #declaring apps
 users.users.${username}.packages = 
  (with pkgs; [
    libnotify
    brightnessctl
    nix-search-tv
    fzf
    youtube-tui
    xwayland-satellite 
    ])
   ++
  (with pkgs-unstable; [
    quick-webapps
    firefox
  ]);

  #enable swap
    swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GB
  }];


      ##battery life tool
      powerManagement.powertop.enable = true;
      services.thermald.enable = true;
      services.auto-cpufreq.enable = true;
        services.auto-cpufreq.settings = {
          battery = {
            governor = "powersave";
            turbo = "never";
          };
          charger = {
            governor = "powersave";
            turbo = "never";
          };
        };



 }


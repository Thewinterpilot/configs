{ inputs, config, lib, pkgs, pkgs-unstable, username, hostname, ... }:


{ 
  

  #enabling services
    programs.hyprland = {
      enable = true;
      xwayland.enable = true; # Xwayland can be disabled.
    };
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
    libnotify
    brightnessctl
    nix-search-tv
    fzf
    youtube-tui    
    ])
   ++
  (with pkgs-unstable; [
    cliphist
    wl-clipboard
    imagemagick
    pywal16
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


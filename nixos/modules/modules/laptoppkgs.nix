{config, lib, pkgs, pkgs-unstable, username, hostname, ... }:


{ 
  

  #enabling services
    programs.hyprland.enable = true;


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
      
      ])
   ++
  (with pkgs-unstable; [
    cliphist
    wl-clipboard
    imagemagick
    pywal16
    quick-webapps
    lazygit
    firefox
  ]);



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


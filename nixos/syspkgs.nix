{ config, pkgs, ...}:

{  

  #set up nerdfonts
    fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  #enabling services
  #hyprland is a dynamic tiling window manager and wayland compositor
    programs.hyprland.enable = true;
  #ly is a simple, tui display manager with a minimal login screen look
    services.displayManager.ly.enable = true;

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

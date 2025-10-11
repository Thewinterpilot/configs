{ inputs, config, pkgs, pkgs-unstable, hostname, username, ... }:




{

  imports = [ inputs.home-manager.nixosModules.home-manager ];

    #user
  users.users= {
    ${username} = {
      isNormalUser = true;
      description = "main user";
      extraGroups = [ "networkmanager" "wheel" ];
  };};

  #set up nerdfonts
    fonts.packages = [ 
      pkgs.nerd-fonts.jetbrains-mono 
      pkgs.maple-mono.NF 
    ];



  
  services.displayManager = {
    ly.enable = true;
	autoLogin.enable = false;
	autoLogin.user = "${username}";
  };



environment.systemPackages = 
  (with pkgs; [
  pridecat
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
      zed-editor
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
    #usb tool writer
      mediawriter
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



   

    #home manager things
      home-manager = {
        backupFileExtension = "hm-backup";
        useUserPackages = true;
        useGlobalPkgs = true;
        users.${username} = import ./home.nix;
      };
              

  services = {
    #Enable touchpad support.
      libinput.enable = true;
    #needed for samba shares
      gvfs.enable = true;
    #Power button invokes hibernate, not shutdown.
      #logind = {
      
      #LidSwitch = "sleep";
      #}; 
    #xserver things idk
      xserver.enable = true;

      xserver.xkb = {
        layout = "us";
        variant = "";
      };
};



  #enable the polkit for sudo permissions in vscode
    security.polkit.enable = true;
      systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit is a permission management toolkit that vscode uses";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };


environment.variables = { EDITOR = "vim"; };


#bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings= {
      General = {
        Experimental = true;
        FastConnectable = true;
	    };
    Policy.AutoEnable = true;
	    };
  };

  
  #appimage support
    boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
    };
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    programs.appimage.package = pkgs.appimage-run.override { extraPkgs = pkgs: [pkgs.python312]; };

#Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

  #keep kernel up to date
    # boot.kernelPackages = pkgs.linuxPackages_latest;

  #Enable networking
    networking.networkmanager.enable = true;
    networking.hostName = "${hostname}";

  #auto clean
    system.autoUpgrade.enable = true;
    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 4d";
    };

  #enable flakes
    nix.settings.experimental-features = ["nix-command" "flakes" ];
    
  #unfree packages
    nixpkgs.config.allowUnfree = true;
  #locale 
    time.timeZone = "America/Vancouver";
    i18n.defaultLocale = "en_CA.UTF-8";


  #Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };



  services.logind.lidSwitch = "sleep";
  services.logind.lidSwitchExternalPower = "ignore";


    networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns    '';
  #allowing network ports for samba shares
    networking.firewall.allowedTCPPorts = [ 455 139 138 127 ];
 
  #dont change this when you update
    system.stateVersion = "25.05";



}

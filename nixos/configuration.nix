{ inputs, config, lib, pkgs, username, hostname, ... }:



{
  imports =
    [
      ./hardware-configs/${hostname}-hw.nix
      ./modules/base.nix
      ./modules/laptoppkgs.nix
      inputs.home-manager.nixosModules.home-manager
    ];


  #user
  users.users= {
    ${username} = {
      isNormalUser = true;
      description = "main user";
      extraGroups = [ "networkmanager" "wheel" ];
      
  };};


}

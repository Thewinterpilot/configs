# how my nixos directory works

this is a *modular configuration* made to be easily transfered to new systems.

it all starts with the flake.nix file which does a few things:
    - allows for simultanious use of the nixpkgs stable and nixpkgs unstable repos
    - allows for easy changing of hostname and username by changing one variable
    - allows configuration.nix and home.nix to actually configure things


configuration.nix allows you to import the other modules in from the modules and hardware-configs directories to customize the system to your liking, install apps, etc.

home.nix is mostly just declaritave bashrc configuration at this point but I plan to figure out how to do more with it.

if you want to fork mine you can do whatever you want but I reccomend putting your own name and hostname in, adding your own hardware configuration to the hardware-configs.nix directory, and then customizing your installed apps and whatnot appropriately of course. 

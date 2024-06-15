{ inputs, config, lib, pkgs, ... }:
{
 imports = [ 
   ../cherry/system.nix
   ../../modules/system/xmonad-laptop-power.nix
 ];

 # Enable touchpad support (enabled default in most desktopManager).
 # services.libinput.enable = true;

 home-manager.users = lib.mkForce {
   "starry" = import ./home.nix;
 };
}

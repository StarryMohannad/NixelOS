{ config, pkgs, ... }:

{
 # Enable the X11 windowing system.
 services.xserver.enable = true;

 # LightDM as the Display Manager
 services.xserver.displayManager.lightdm.enable = true;
 services.xserver.displayManager.lightdm.extraConfig = ''user-authority-in-system-dir = true'';

 # XMonad with Contib and Extra Packages
 services.xserver.windowManager.xmonad.enable = true;
 services.xserver.windowManager.xmonad.enableContribAndExtras = true;
 
 # XDG Portal
 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 xdg.portal.config.common.default = "*";
}

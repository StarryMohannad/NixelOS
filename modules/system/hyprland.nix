{ config, pkgs, ... }:

{
 services.xserver.enable = true;

 # LightDM as the Display Manager
 services.xserver.displayManager.lightdm.enable = true;
 services.xserver.displayManager.lightdm.extraConfig = ''user-authority-in-system-dir = true'';

 programs.hyprland.enable = true;
 programs.hyprland.xwayland.enable = true;

 # XDG Portal
 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
 xdg.portal.config.common.default = "*";
}

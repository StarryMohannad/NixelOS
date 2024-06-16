{ config, pkgs, ... }:

{
 # SDDM as the Display Manager
 services.displayManager.sddm.enable = true;
 services.displayManager.sddm.wayland.enable = true;

 programs.hyprland.enable = true;
 programs.hyprland.xwayland.enable = true;

 # XDG Portal
 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
 xdg.portal.config.common.default = "*";

 # Hyprlock
 security.pam.services.hyprlock = {};
}

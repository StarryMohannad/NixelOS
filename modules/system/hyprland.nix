{ config, pkgs, ... }:

{
 services.xserver.enable = true;

 # LightDM as the Display Manager
 services.xserver.displayManager.lightdm.enable = true;
 services.xserver.displayManager.lightdm.extraConfig = ''user-authority-in-system-dir = true'';

 wayland.windowManager.hyprland.enable = true;
 wayland.windowManager.hyprland.xwayland.enable = true;
}

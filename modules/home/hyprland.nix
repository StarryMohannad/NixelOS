{ pkgs, config, lib, ... }:

{
 wayland.windowManager.hyprland.enable = true;
 wayland.windowManager.hyprland.xwayland.enable = true;

 programs.rofi.pass.package = pkgs.rofi-pass-wayland;
 
 programs.waybar.enable = true;

 home.sessionVariables.NIXOS_OZONE_WL = "1";
}

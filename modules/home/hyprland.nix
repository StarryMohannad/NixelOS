{ pkgs, config, lib, ... }:

{
 programs.hyprland.enable = true;
 programs.hyprland.xwayland.enable = true;

 programs.rofi.pass.package = pkgs.rofi-pass-wayland;
 
 programs.waybar.enable = true;

 enviroment.sessionVaribles."NIXOS_OZONE_WL" = "1";
}

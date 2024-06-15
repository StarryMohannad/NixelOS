{ pkgs, config, builitins, ... }:

{
 wayland.windowManager.hyprland.enable = true;

 wayland.windowManager.hyprland.xwayland.enable = true;
 home.sessionVariables.NIXOS_OZONE_WL = "1";

 programs.rofi.package = pkgs.rofi-wayland;
 programs.waybar.enable = true;

 home.file.".local/share/sounds".source = ../files/sounds;
 home.file.".local/share/scripts".source = ../files/scripts;
 home.file.".local/share/kaomoji".source = ../files/kaomoji;

 wayland.windowManager.hyprland.extraConfig = builtins.readfile(./hypr.conf);
}

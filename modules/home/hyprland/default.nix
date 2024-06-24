{ pkgs, config, builitins, lib, ... }:

{
 imports = [
   ./hypr.nix
   ./waybar.nix
   ./hyprpaper.nix
   ./hyprlock.nix
   ./packages.nix
 ];

 # Notification Daemon
 services.mako.enable = true;
 services.mako.anchor = "bottom-right";
 services.mako.margin = "0,25,25";

 programs.wofi.enable = true; # Menu

 # Sourcing Files
 home.file.".local/share/sounds".source = ./files/sounds;
 home.file.".local/share/scripts".source = ./files/scripts;
 home.file.".local/share/kaomoji".source = ./files/kaomoji;
 home.file.".local/share/wallpaper.png".source = ../../wallpaper.png;
 
 # Session Varibles
 home.sessionVariables.NIXOS_OZONE_WL = "1";
}

{ pkgs, config, builitins, lib, ... }:

{
 description = "the Hyprland Window Manager will all of it's glorry";

 imports = [
   ./hypr.nix
   ./waybar.nix
   ./hyprpaper.nix
   ./hyprlock.nix
   ./packages.nix
 ];

 services.mako.enable = true; # Notification Daemon
 programs.wofi.enable = true; # Menu

 # Sourcing Files
 home.file.".local/share/sounds".source = ./files/sounds;
 home.file.".local/share/scripts".source = ./files/scripts;
 home.file.".local/share/kaomoji".source = ./files/kaomoji;
 home.file.".local/share/wallpaper.png".source = ../../wallpaper.png;
 
 # Session Varibles
 home.sessionVariables.NIXOS_OZONE_WL = "1";
}

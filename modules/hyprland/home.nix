{ pkgs, config, builitins, lib, ... }:

{
 imports = [
   ./home-sub/hypr.nix
   ./home-sub/waybar.nix
   ./home-sub/hyprpaper.nix
   ./home-sub/hyprlock.nix
   ./home-sub/packages.nix
 ];


 services.mako.enable = true; # Notification Daemon
 programs.wofi.enable = true; # Menu

 # Sourcing Files
 home.file.".local/share/sounds".source = ./sub-files/sounds;
 home.file.".local/share/scripts".source = ./sub-files/scripts;
 home.file.".local/share/kaomoji".source = ./sub-files/kaomoji;
 home.file.".local/share/wallpaper.png".source = ../../wallpaper.png;
 
 # Session Varibles
 home.sessionVariables.NIXOS_OZONE_WL = "1";
}

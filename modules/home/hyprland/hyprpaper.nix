{ config, pkgs, ... }:

{
 description = "the Wallpaper Daemon";

 # Enable Wallpaper 
 services.hyprpaper.enable = true;
 
 # Settings
 services.hyprpaper.settings.splash = false;
 services.hyprpaper.settings.ipc = "on";

 # Pre and Load Wallaper
 services.hyprpaper.settings.preload = [ "~/.local/share/wallpaper.png" ];
 services.hyprpaper.settings.wallpaper = [ "eDP-1,~/.local/share/wallpaper.png" ];
}

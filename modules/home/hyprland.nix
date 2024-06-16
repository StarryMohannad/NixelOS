{ pkgs, config, builitins, ... }:

{
 # Hyprland (Window Manager)
 wayland.windowManager.hyprland.enable = true;
 wayland.windowManager.hyprland.xwayland.enable = true;

 # Waybar (top bar)
 programs.waybar.enable = true;
 programs.waybar.settings= [{
   height = 15;
   modules-left = [ "hyprland/workspaces" ]; 
   modules-center = [ "mpd" ];
   modules-right = [
     "battery"
     "clock"
     "tray"
   ];
   battery = {
     interval = 5;
     format = "{capacity}% {icon}";
     format-charging = "{capacity}%  |";
     format-icons = [ " " " " " " " " " " ];
     format-plugged = "{capacity}% ";
     states = {
       critical = 15;
       warning = 30;
     };
   };
   clock = {
     interval = 5;
     format = "{:%H:%M}   | ";
     tooltip-format = "{:%Y-%m-%d %A}";
   };
   mpd = {
     interval = 5;
     format = "  {artist} - {title}";
     format-disconnected = "  Offline";
     format-stopped = "  Stopped"; 
     format-paused = "  Paused";
   };
 }];

 # Hyprpaper (for wallpaper)
 services.hyprpaper.enable = true;
 services.hyprpaper.settings.splash = false;
 services.hyprpaper.settings.ipc = "on";

 services.hyprpaper.settings.preload = [ "~/.local/share/wallpaper.png" ];
 services.hyprpaper.settings.wallpaper = [ "eDP-1,~/.local/share/wallpaper.png" ];

 # Hyprlock (for lockscreen)
 programs.hyprlock.enable = true;
 programs.hyprlock.settings.background.path = "~/.local/share/wallpaper.png";
 programs.hyprlock.settings.input-field = [{
   size = "350, 40";
   position = "0, -80";
   monitor = "";
   dots_center = true;
   fade_on_empty = false;
   outline_thickness = 5;
   shadow_passes = 2;
 }];

 # Sourcing Files
 home.file.".local/share/sounds".source = ../files/sounds;
 home.file.".local/share/scripts".source = ../files/scripts;
 home.file.".local/share/kaomoji".source = ../files/kaomoji;
 home.file.".local/share/wallpaper.png".source = ../files/wallpaper.png;
 
 # Sourcing External Configs
 wayland.windowManager.hyprland.extraConfig = builtins.readFile(../files/configs/hypr.conf);
 programs.waybar.style = builtins.readFile(../files/configs/waybar.css);

 # Session Varibles
 home.sessionVariables.NIXOS_OZONE_WL = "1";
}

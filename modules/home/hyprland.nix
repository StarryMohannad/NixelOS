{ pkgs, config, builitins, ... }:

{
 wayland.windowManager.hyprland.enable = true;
 wayland.windowManager.hyprland.extraConfig = builtins.readFile(../files/configs/hypr.conf);

 wayland.windowManager.hyprland.xwayland.enable = true;
 home.sessionVariables.NIXOS_OZONE_WL = "1";

 programs.waybar.enable = true;
 programs.waybar.style = builtins.readFile(../files/configs/waybar.css);
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

 home.file.".local/share/sounds".source = ../files/sounds;
 home.file.".local/share/scripts".source = ../files/scripts;
 home.file.".local/share/kaomoji".source = ../files/kaomoji;

 home.file.".local/share/wallpaper.png".source = ../files/wallpaper.png;

}

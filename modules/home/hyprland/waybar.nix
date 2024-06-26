{ config, pkgs, ... }:

{
 # Enable Status Bar
 programs.waybar.enable = true;
 
 # Waybar Settings
 programs.waybar.settings = [{
   height = 10;
   modules-left = [ "hyprland/workspaces" ]; 
   modules-center = [ "mpd" ];
   modules-right = [
     "custom/weather"
     "battery"
     "clock"
     "tray"
   ];
   battery = {
     interval = 5;
     format = "{capacity}% {icon}|";
     format-charging = "{capacity}%  |";
     format-icons = [ " " " " " " " " " " ];
     states = {
       critical = 15;
       warning = 30;
     };
   };
   clock = {
     interval = 5;
     format = "{:%H:%M}  | ";
     tooltip-format = "{:%Y-%m-%d %A}";
   };
   mpd = {
     interval = 5;
     format = "  {artist} - {title}";
     format-disconnected = "  Offline";
     format-stopped = "  Stopped"; 
     format-paused = "  Paused";
   };
   "custom/weather" = {
     format = "{}|";
     tooltip = true;
     interval = 10;
     exec = "wttrbar --custom-indicator '{temp_C}° {ICON}'";
     return-type = "json";
   };
 }];

 # Waybar Style
 programs.waybar.style = ''
  * {
    border: none;
    border-radius: 0;
    font-family: "FiraCode Nerd Font";
    font-size: 1px;
    min-height: 0;
  }

  window#waybar {
    border-bottom: 3px solid #${config.lib.stylix.colors.base02};
    color: #${config.lib.stylix.colors.base05};
  }

  tooltip {
    border: 1px solid #${config.lib.stylix.colors.base02};
  }
  tooltip label {
    color: #${config.lib.stylix.colors.base05};
  }

  #workspaces button {
    padding: 0 5px;
    background: transparent;
    color: white;
    border-bottom: 3px solid transparent;
  }

  #workspaces button.focused {
    border-bottom: 3px solid #${config.lib.stylix.colors.base07};
  }

  #mode, #clock, #battery {
    padding: 0 10px;
  }

  #mode {
    border-bottom: 3px solid #${config.lib.stylix.colors.base07};
  }
 '';

}

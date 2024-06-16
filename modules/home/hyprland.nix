{ pkgs, config, builitins, lib, ... }:

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
 programs.waybar.style = ''
  * {
    border: none;
    border-radius: 0;
    font-family: "FiraCode Nerd Font";
    font-size: 10px;
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

 # Hyprpaper (for wallpaper)
 services.hyprpaper.enable = true;
 services.hyprpaper.settings.splash = false;
 services.hyprpaper.settings.ipc = "on";

 services.hyprpaper.settings.preload = [ "~/.local/share/wallpaper.png" ];
 services.hyprpaper.settings.wallpaper = [ "eDP-1,~/.local/share/wallpaper.png" ];

 # Hyprlock (for lockscreen)
 programs.hyprlock.enable = true;
 programs.hyprlock.settings.background.path = "~/.local/share/wallpaper.png";
 programs.hyprlock.settings.background.blur_passes = 2;
 programs.hyprlock.settings.background.blur_size = 4;

 programs.hyprlock.settings.input-field.font_color = "rgb(${config.lib.stylix.colors.base05})";
 programs.hyprlock.settings.input-field.inner_color = "rgb(${config.lib.stylix.colors.base00})";
 programs.hyprlock.settings.input-field.outer_color = "rgb(${config.lib.stylix.colors.base01})";

 programs.hyprlock.settings.input-field.size = "350, 40";
 programs.hyprlock.settings.input-field.position = "0, -80";
 programs.hyprlock.settings.input-field.monitor = "";
 programs.hyprlock.settings.input-field.dots_center = true;
 programs.hyprlock.settings.input-field.fade_on_empty = false;
 programs.hyprlock.settings.input-field.outline_thickness = 5;
 programs.hyprlock.settings.input-field.shadow_passes = 2;

 # Sourcing Files
 home.file.".local/share/sounds".source = ../files/sounds;
 home.file.".local/share/scripts".source = ../files/scripts;
 home.file.".local/share/kaomoji".source = ../files/kaomoji;
 home.file.".local/share/wallpaper.png".source = ../files/wallpaper.png;
 
 # Sourcing External Configs
 wayland.windowManager.hyprland.extraConfig = builtins.readFile(../files/configs/hypr.conf);

 # Session Varibles
 home.sessionVariables.NIXOS_OZONE_WL = "1";
}

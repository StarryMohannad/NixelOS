{ pkgs, config, builitins, lib, ... }:

{
 # Hyprland (Window Manager)
 wayland.windowManager.hyprland.enable = true;

 wayland.windowManager.hyprland.settings.monitor = [ "eDP-1,1920x1080@60,0x0,1" ];

 wayland.windowManager.hyprland.settings.master.new_is_master = true;
 wayland.windowManager.hyprland.settings.general.border_size = 3;

 wayland.windowManager.hyprland.settings.input.follow_mouse = 1;
 wayland.windowManager.hyprland.settings.input.kb_layout = "us,ara";
 wayland.windowManager.hyprland.settings.input.kb_options = [ "grp:win_space_toggle" ];
 
 wayland.windowManager.hyprland.settings."$modkey" = "SUPER";
 wayland.windowManager.hyprland.settings."$Smodkey" = "SUPER SHIFT";
 wayland.windowManager.hyprland.settings.bind = [
   "$Smodkey, RETURN, exec, kitty"
   "$modkey, b, exec, firefox"
   "$modkey, e, exec, thunar"
   "$modkey, m, exec, kitty ncmpcpp"
 ] ++
 [
   "$modkey, p, exec, wofi --show drun"
   "$modkey, period, exec, ~/.local/share/scripts/pf-emoji"
   "$modkey, comma, exec, ~/.local/share/scripts/pf-kaomoji"
 ] ++
 [
   ", XF86AudioRaiseVolume, exec, ~/.local/share/pf-volume up"
   ", XF86AudioLowerVolume, exec, ~/.local/share/pf-volume down"
   ", XF86AudioMute, exec, ~/.local/share/pf-volume mute"

   ", XF86MonBrightnessUp, exec, ~/.local/share/pf-brightness up"
   ", XF86MonBrightnessDown, exec, ~/.local/share/pf-brightness down"
 ] ++
 [
   "$Smodkey, c, killactive"
   "$modkey, f, togglefloating"
 ] ++
 [
   "$modkey, k, cyclenext"
   "$modkey, j, cyclenext, prev"
 ] ++   
 [
   "$modkey, l, workspace, e+1"
   "$modkey, h, workspace, e-1"
   "$modkey, mouse_up, workspace, e-1"
   "$modkey, mouse_down, workspace, e+1"

   "$Smodkey, l, movetoworkspace, e+1"
   "$Smodkey, h, movetoworkspace, e-1"
 ] ++
 [
   "$Smodkey, p, exec, hyprlock"
   "$modkey, q, exec, hyprctl reload"
   "$Smodkey, q, exit"
 ] ++
 (builtins.concatLists (builtins.genList (
   x: let
     ws = let
       c = (x + 1) / 10;
     in
       builtins.toString (x + 1 - (c * 10));
   in [
     "$modkey, ${ws}, workspace, ${toString (x + 1)}"
     "$Smodkey, ${ws}, movetoworkspace, ${toString (x + 1)}"
   ]
 )10));
 wayland.windowManager.hyprland.settings.bindm = [
   "$modkey, mouse:272, movewindow"
   "$modkey, mouse:273, resizewindow"
 ];

 wayland.windowManager.hyprland.settings.exec-once = [ "setsid -f mpv --no-video ~/.local/share/sounds/startup.mp3" ];
 wayland.windowManager.hyprland.settings.exec = [
   "killall .waybar-wrapped"
   "setsid -f waybar -c ~/.config/waybar/config"
 ];

 # Waybar (top bar)
 programs.waybar.enable = true;
 programs.waybar.settings= [{
   height = 15;
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
 # wayland.windowManager.hyprland.extraConfig = builtins.readFile(../files/configs/hypr.conf);

 # Session Varibles
 home.sessionVariables.NIXOS_OZONE_WL = "1";
}

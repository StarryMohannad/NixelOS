{ config, pkgs, ... }:

{
 # Enable Window Manager
 wayland.windowManager.hyprland.enable = true;

 # Display Settings
 wayland.windowManager.hyprland.settings.monitor = [ "eDP-1,1920x1080@60,0x0,1" ];

 # Appearance Settings
 wayland.windowManager.hyprland.settings.master.new_is_master = true;
 wayland.windowManager.hyprland.settings.general = {
  border_size = 3;
  gaps_in = 6;
  gaps_out = 6;
 };

 # Input Settings
 wayland.windowManager.hyprland.settings.input.follow_mouse = 1;
 wayland.windowManager.hyprland.settings.input.kb_layout = "us,ara";
 wayland.windowManager.hyprland.settings.input.kb_options = [ "grp:win_space_toggle" ];
 
 # Binds
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
   ", XF86AudioRaiseVolume, exec, ~/.local/share/scripts/pf-volume up"
   ", XF86AudioLowerVolume, exec, ~/.local/share/scripts/pf-volume down"
   ", XF86AudioMute, exec, ~/.local/share/scripts/pf-volume mute"

   ", XF86MonBrightnessUp, exec, ~/.local/share/scripts/pf-brightness up"
   ", XF86MonBrightnessDown, exec, ~/.local/share/scripts/pf-brightness down"
 ] ++
 [
   "$modkey, print, exec, ~/.local/share/scripts/pf-screenshot fullscreen"
   ", print, exec, ~/.local/share/scripts/pf-screenshot rectangle"
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

 # Autostart
 wayland.windowManager.hyprland.settings.exec-once = [ "setsid -f mpv --no-video ~/.local/share/sounds/startup.mp3" ];
 wayland.windowManager.hyprland.settings.exec = [
   "killall .waybar-wrapped"
   "setsid -f waybar -c ~/.config/waybar/config"
 ];
}

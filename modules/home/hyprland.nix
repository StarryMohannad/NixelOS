{ pkgs, config, lib, ... }:

{
 wayland.windowManager.hyprland.enable = true;

 wayland.windowManager.hyprland.xwayland.enable = true;
 home.sessionVariables.NIXOS_OZONE_WL = "1";

 programs.rofi.package = pkgs.rofi-wayland;
 programs.waybar.enable = true;

 home.files."~/.local/share/sounds".source = ../files/sounds;
 home.files."~/.local/share/scripts".source = ../files/scripts;

 wayland.windowManager.hyprland.extraConfig = ''
   monitor=eDP-1,1920x1080@60,0x0,1

   master {
    new_is_master = true
   }

   input {
    follow_mouse = 1
    
    kb_layout = us,ara
    kb_options = grp:win_space_toggle
   }

   # Keybinds

   $mainMod = SUPER
   $terminal = kitty
   $browser = firefox
   $filebrowser = thunar
   $menu = rofi -show drun -show-icons

   bind = $mainMod SHIFT, RETURN, exec, $terminal
   bind = $mainMod, b, exec, $browser
   bind = $mainMod, e, exec, $filebrowser

   bind = $mainMod SHIFT, c, killactive,
   bind = $mainMod, p, exec, $menu

   bind =, XF86AudioRaiseVolume, exec, ~/.local/share/scripts/pf-volume up
   bind =, XF86AudioLowerVolume, exec, ~/.local/share/scripts/pf-volume down
   bind =, XF86AudioMute, exec, ~/.local/share/scripts/pf-volume

   bind =, XF86MonBrightnessDown, exec, ~/.local/share/scripts/pf-brightness down
   bind =, XF86MonBrightnessUp, exec, ~/.local/share/scripts/pf-brightness up
  
   bind = $mainMod, print, exec, ~/.local/share/scripts/pf-screenshot fullscreen
   bind =, print, exec, ~/.local/share/scripts/pf-screenshot rectangle 
 
   bind = $mainMod, period, exec, ~/.local/share/scripts/pf-emoji
   bind = $mainMod, comma, exec, ~/.local/share/scripts/pf-kamoji

   bind = $mainMod, k, cyclenext,
   bind = $mainMod, j, cyclenext, prev

   bind = $mainMod, l, workspace, e+1
   bind = $mainMod, h, workspace, e-1

   bind = $mainMod SHIFT, l, movetoworkspace, e+1
   bind = $mainMod SHIFT, h, movetoworkspace, e-1

   bind = $mainMod, f, togglefloating,

   bind = $mainMod, 1, workspace, 1
   bind = $mainMod, 2, workspace, 2
   bind = $mainMod, 3, workspace, 3
   bind = $mainMod, 4, workspace, 4
   bind = $mainMod, 5, workspace, 5
   bind = $mainMod, 6, workspace, 6
   bind = $mainMod, 7, workspace, 7
   bind = $mainMod, 8, workspace, 8
   bind = $mainMod, 9, workspace, 9
   bind = $mainMod, 0, workspace, 10

   bind = $mainMod SHIFT, 1, movetoworkspace, 1
   bind = $mainMod SHIFT, 2, movetoworkspace, 2
   bind = $mainMod SHIFT, 3, movetoworkspace, 3
   bind = $mainMod SHIFT, 4, movetoworkspace, 4
   bind = $mainMod SHIFT, 5, movetoworkspace, 5
   bind = $mainMod SHIFT, 6, movetoworkspace, 6
   bind = $mainMod SHIFT, 7, movetoworkspace, 7
   bind = $mainMod SHIFT, 8, movetoworkspace, 8
   bind = $mainMod SHIFT, 9, movetoworkspace, 9
   bind = $mainMod SHIFT, 0, movetoworkspace, 10

   # Scroll through existing workspaces with mainMod + scroll
   bind = $mainMod, mouse_down, workspace, e+1
   bind = $mainMod, mouse_up, workspace, e-1

   # Move/resize windows with mainMod + LMB/RMB and dragging
   bindm = $mainMod, mouse:272, movewindow
   bindm = $mainMod, mouse:273, resizewindow
 '';
}

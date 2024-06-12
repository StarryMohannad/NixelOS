{ pkgs, lib, config, ... }:

{
 gtk.enable = true;
 gtk.gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
 gtk.gtk2.extraConfig = ''gtk-theme-name = "adw-gtk3"'';

 stylix.opacity.terminal = 0.8;
}

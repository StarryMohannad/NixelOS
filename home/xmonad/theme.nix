{ pkgs, lib, config, ... }:

{
 gtk.enable = true;
 gtk.gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
 gtk.gtk2.extraConfig = ''gtk-theme-name = "adw-gtk3"'';

 stylix.fonts.sizes.applications = 11;
 stylix.fonts.sizes.desktop = 11;
 stylix.fonts.sizes.popups = 8;
 stylix.fonts.sizes.terminal = 11;

 stylix.cursor.package = pkgs.bibata-cursors;
 stylix.cursor.name = "Bibata-Modern-Ice";
 stylix.cursor.size = 24;

 stylix.opacity.terminal = 0.8;
}

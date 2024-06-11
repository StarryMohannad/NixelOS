{ config, pkgs, ... }:

{
 gtk.enable = true;
 gtk.gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

 gtk.theme = {
   package = pkgs.gruvbox-dark-gtk;
   name = "gruvbox-dark";
 };

 gtk.iconTheme.name = "oomox-gruvbox-dark";

 gtk.font = {
      name = "FiraCode Nerd Font Regular";
      size = 11;
   };
}

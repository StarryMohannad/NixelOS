{ config, pkgs, ... }:

{
 description = "Lock Screen Config";
 
 # Enable Lock Screen
 programs.hyprlock.enable = true;

 # Background Settings
 programs.hyprlock.settings.background = {
   path = "~/.local/share/wallpaper.png";
   blur_passes = 2;
   blur_size = 4;
 };

 # Input Field Settings
 programs.hyprlock.settings.input-field = {
   font_color = "rgb(${config.lib.stylix.colors.base05})";
   inner_color = "rgb(${config.lib.stylix.colors.base00})";
   outer_color = "rgb(${config.lib.stylix.colors.base01})";

   size = "350, 40";
   position = "0, -80";
   monitor = "";
   dots_center = true;
   fade_on_empty = false;
   outline_thickness = 5;
   shadow_passes = 2;
 };
}

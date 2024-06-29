{ pkgs, config, ... }:

{
 stylix.enable = true;
 stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
 stylix.image = ../../../wallpaper.png;

 stylix.cursor.size = 24;

 stylix.fonts.monospace.package = pkgs.nerdfonts;
 stylix.fonts.monospace.name = "FiraCode Nerd Font";

 stylix.fonts.sansSerif.package = pkgs.nerdfonts;
 stylix.fonts.sansSerif.name = "FiraCode Nerd Font";

 stylix.fonts.serif.package = pkgs.nerdfonts;
 stylix.fonts.serif.name = "FiraCode Nerd Font";
}

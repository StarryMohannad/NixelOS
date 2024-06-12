{ config, imports, pkgs, ... }:

{
 stylix.fonts.monospace.package = pkgs.nerdfonts;
 stylix.fonts.monospace.name = "FiraCode Nerd Font";

 stylix.fonts.sansSerif.package = pkgs.nerdfonts;
 stylix.fonts.sansSerif.name = "FiraCode Nerd Font";

 stylix.fonts.serif.package = pkgs.nerdfonts;
 stylix.fonts.serif.name = "FiraCode Nerd Font";
}

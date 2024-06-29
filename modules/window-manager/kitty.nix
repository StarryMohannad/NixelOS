{ config, pkgs, ... }:

{
 programs.kitty.enable = true;

 stylix.fonts.sizes.terminal = 11;
 stylix.opacity.terminal = 0.8;
}

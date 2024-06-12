{ imports, config, ... }:

{
 imports = [
   ./rofi.nix
   ./trayer.nix
 ];
 
 programs.dunst.enable = true;
}

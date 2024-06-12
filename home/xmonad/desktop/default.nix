{ imports, config, ... }:

{
 imports = [
   ./rofi.nix
   ./trayer.nix
 ];
 
 services.dunst.enable = true;
}

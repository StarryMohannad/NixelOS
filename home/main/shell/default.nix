{ pkgs, inputs, ... }:

{
 imports = [
   ./zsh.nix
   ./starship.nix
 ];

 programs.bat.enable = true;
 programs.btop.enable = true;
 programs.eza.enable = true;
 programs.zoxide.enable = true;
}

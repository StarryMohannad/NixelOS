{ pkgs, inputs, ... }:

{
 imports = [
   ./impermanence.nix
   ./packages.nix
   ./starship.nix
   ./zsh.nix
 ];

 programs.bat.enable = true;
 programs.btop.enable = true;
 programs.eza.enable = true;
 programs.zoxide.enable = true;
}

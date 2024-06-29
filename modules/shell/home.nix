{ pkgs, inputs, ... }:

{
 imports = [
   ./home-sub/impermanence.nix
   ./home-sub/packages.nix
   ./home-sub/starship.nix
   ./home-sub/zsh.nix
 ];

 programs.bat.enable = true;
 programs.btop.enable = true;
 programs.eza.enable = true;
 programs.zoxide.enable = true;
}

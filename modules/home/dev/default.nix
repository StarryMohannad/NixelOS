{ config, pkgs, ... }:

{
 imports = [
   ./impermanence.nix
   ./git.nix
   ./gpg.nix
 ];
}

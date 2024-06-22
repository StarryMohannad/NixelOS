{ config, pkgs, inputs, ... }:

{
 imports = [
   ./externsions.nix
   ./config.nix
 ];

 programs.firefox.enable = true;
 programs.firefox.arkenfox.enable = true;

 stylix.targets.firefox.profileNames = ["starry"];
}

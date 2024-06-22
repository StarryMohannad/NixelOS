{ config, pkgs, inputs, ... }:

{
 imports = [
   ./extensions.nix
 ];

 programs.firefox.enable = true;
 programs.firefox.arkenfox.enable = true;

 stylix.targets.firefox.profileNames = ["starry"];
}

{ config, pkgs, inputs, ... }:

{
 imports = [
   inputs.arkenfox.hmModules.default

   ./config.nix
   ./extensions.nix
 ];

 programs.firefox.enable = true;
 programs.firefox.arkenfox.enable = true;
 programs.firefox.arkenfox.version = "126.1";
}

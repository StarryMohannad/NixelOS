{ config, pkgs, inputs, ... }:

{
 imports = [
   inputs.nixvim.homeManagerModules.nixvim 

   ./config.nix
   ./plugins.nix
 ];
 
 programs.nixvim.enable = true;
 programs.nixvim.defaultEditor = true;

}

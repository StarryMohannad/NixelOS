{ config, pkgs, inputs, ... }:

{
 inputs = [
   inputs.nixvim.homeManagerModules.nixvim 
 ];
 
 programs.nixvim.enable = true;
 programs.nixvim.defaultEditor = true;
}

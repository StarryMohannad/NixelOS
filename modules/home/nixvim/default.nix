{ config, pkgs, inputs, ... }:

{
 imports = [
   inputs.nixvim.homeManagerModules.nixvim 
 ];
 
 programs.nixvim.enable = true;
 programs.nixvim.defaultEditor = true;

 stylix.targets.nixvim.enable = false;
 programs.nixvim.colorschemes.catppuccin.enable = true;
 programs.nixvim.colorschemes.catppuccin.settings.flavors = "frappe";
}

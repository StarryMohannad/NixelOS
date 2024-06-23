{ config, pkgs, ... }:

{
 # Colorscheme
 stylix.targets.nixvim.enable = false;
 programs.nixvim.colorschemes.catppuccin.enable = true;
 programs.nixvim.colorschemes.catppuccin.settings.flavors = "frappe";

 # Set Relative Numbers
 programs.nixvim.opts.number = true;
 programs.nixvim.opts.relativenumber = true;
 
 # Spaces >>> Tabs
 programs.nixvim.opts.expandtab = true;
 programs.nixvim.opts.smartindent = true;
 programs.nixvim.opts.tabstop = 2;
 programs.nixvim.opts.shiftwidth = 1;
}

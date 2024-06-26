{ config, pkgs, ... }:

{
 programs.nixvim.plugins.cmp.enable = true;
 programs.nixvim.plugins.cmp.autoEnableSources
 programs.nixvim.plugins.neocord.enable = true;
 programs.nixvim.plugins.neogit.enable = true;
 programs.nixvim.plugins.fzf-lua.enable = true;
 programs.nixvim.plugins.telescope.enable = true;
 # programs.nixvim.plugins.lualine.enable = true;
 
 programs.nixvim.plugins.lazy.enable = true;
 programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
   vim-orgmode
   vim-table-mode
 ];
}

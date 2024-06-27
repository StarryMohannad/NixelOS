{ config, pkgs, lib, ... }:


let
  fromGitHub = ref: rev: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
      rev = rev;
   };
  };
in {
 programs.nixvim.plugins.cmp.enable = true;
 programs.nixvim.plugins.cmp.autoEnableSources = true;

 programs.nixvim.plugins.neocord.enable = true;
 programs.nixvim.plugins.neogit.enable = true;
 programs.nixvim.plugins.fzf-lua.enable = true;
 programs.nixvim.plugins.telescope.enable = true;
 # programs.nixvim.plugins.lualine.enable = true;
 
 programs.nixvim.plugins.lazy.enable = true;
 programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
   {
    plugin = orgmode;
    config = "lua require('orgmode').setup{}";
   }
   vim-table-mode
   {
     plugin = (fromGitHub "HEAD" "ea3e467bef7a2c17998bc471844bbd7bd3438f84" "ranjithshegde/orgWiki.nvim");
     config = "lua require('orgWiki').setup {wiki_path = { '~/sync/docs/org' }, diary_path = '~/sync/docs/org/diary'}";
   }
 ];
}

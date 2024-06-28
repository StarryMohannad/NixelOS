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
 
 programs.nixvim.plugins.lazy.enable = true;
 programs.nixvim.plugins.lazy.plugins = with pkgs.vimPlugins; [
   vimwiki
   vim-table-mode
 ];
}

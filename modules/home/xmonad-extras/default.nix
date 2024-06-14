{ pkgs, config, inputs, ... }:

{
 # Home Manager is pretty good at managing dotfiles. The primary way to manage
 # plain files is through 'home.file'.
 home.file = {
   ".config/xmonad/xmonad.hs".source = ./configs/xmonad.hs;
   ".config/xmobar.rc".source = ./configs/xmobar.rc;
   
   ".local/share/sounds".source = ./sounds;
   ".local/share/xmonad-data".source = ./data;
   ".local/share/scripts".source = ./scripts;
 };
}


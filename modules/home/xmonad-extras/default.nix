{ pkgs, config, inputs, ... }:

{
 # Home Manager is pretty good at managing dotfiles. The primary way to manage
 # plain files is through 'home.file'.
 home.file = {
   ".config/xmonad/xmonad.hs".source = ../../files/configs/xmonad.hs;
   ".config/xmobar.rc".source = ../../files/configs/xmobar.rc;
   
   ".local/share/sounds".source = ../../files/sounds;
   ".local/share/xmonad-data".source = ../../files/data;
   ".local/share/scripts".source = ../../bin;
 };
}


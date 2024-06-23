{ config, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [
   "dl/persist"
   "sync"
   "proj"
  
   ".config/Thunar"
   ".config/nomacs"
   ".config/keepassxc"
   ".config/syncthing"
  
   ".local/share/mpd"

   ".local/state/syncthing"
   ".cache/keepassxc"
 ];
}

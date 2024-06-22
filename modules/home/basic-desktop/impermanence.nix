{ config, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [
   "dl/persist"
   "sync"
   "proj"
  
   ".config/Thunar"
   ".config.nomacs"
  
   "mpd"
 ]
}

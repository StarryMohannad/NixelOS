{ config, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [
   ".config/syncthing"
   ".local/state/syncthing"
 ]; 
}

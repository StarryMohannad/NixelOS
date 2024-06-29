{ config, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [
   ".config/aseprite" 
   ".config/obs-studio"   
   ".config/GIMP"

   ".local/share/kdenlive"
 ];
}

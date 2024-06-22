{ config, lib, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [] ++
   lib.forEach [
     "aseprite" 
     "obs-studio"   
     "GIMP"
   ] (
     x: ".config/${x}"
   )
   lib.forEach [
     "kdenlive"
   ] (
     x: ".local/share/${x}"
   );
}

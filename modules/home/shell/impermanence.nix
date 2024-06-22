{ config, lib, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [] ++
   lib.forEach [
     "zoxide"
     "zplug"
     "zsh" 
   ] (
     x: ".local/share/${x}"
   );
}

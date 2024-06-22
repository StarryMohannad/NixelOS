{ config, lib, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [] ++
   lib.forEach [
     "dolphin-emu"
     "gzdoom"
     "PCSX2"
   ] (
     x: ".config/${x}" 
   ) ++
   lib.forEach [
     "crispy-doom"
     "dolphin-emu"
     "DoomRunner"
     "duckstation"
     "PrismLauncher"
     "Terraria"
   ] (
     x: ".local/share/${x}"
   );
}

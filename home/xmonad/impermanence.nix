{ lib, ...}: let
 inherit (lib) forEach;

in {
 home.persistence."/persist/home/starry".directories = [
   "Downloads/persist"
   "Sync"
   "Projects"

   ".local/nf"
   ".local/share"
 ]
 ++ forEach ["syncthing" "Vencord" "obs-studio" "aseprite" "dolphin-emu" "PCSX2" "discord" "gzdoom" "GIMP" "Thunar" "keepassxc"] (
      x: ".config/${x}"
 )
 ++ [ ".ssh" ".var" ".mozilla" ];

 home.persistence."/persist/home/starry".allowOther = true;
}


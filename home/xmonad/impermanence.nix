{ lib, ...}: let
 inherit (lib) forEach;

in {
 home.persistence."/persist/home/starry".directories = [
   "Downloads/persist"
   "Sync"
   "Projects"

   ".local/nf"
 ]
 ++ forEach ["syncthing" "Vencord" "obs-studio" "aseprite" "dolphin-emu" "PCSX2" "discord" "gzdoom" "GIMP" "Thunar" "keepassxc"] (
      x: ".config/${x}"
 )
 ++ forEach ["Steam" "flatpak" "crispy-doom" "PrismLauncher" "zplug" "mpd" "Games" "DoomRunner" "duckstation/GameSettings" "duckstation/Screenshots" "dolphin-emu/texture" "dolphin-emu/screenshots"] (
      x: ".local/share/${x}"
 )
 ++ [ ".ssh" ".var" ".mozilla" ];

 home.persistence."/persist/home/starry".allowOther = true;
}


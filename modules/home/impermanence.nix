{ lib, ...}: let
 inherit (lib) forEach;

in {
 home.persistence."/persist/home/starry".directories = [
   "downloads/persist"
   "sync"
   "projects"

   ".local/nf"
 ]
 ++ forEach [
      "aseprite" 
      "discord" 
      "dolphin-emu" 
      "GIMP" 
      "gzdoom" 
      "keepassxc"
      "obs-studio"   
      "PCSX2" 
      "syncthing" 
      "Thunar" 
      "Vencord" ] ( 
      x: ".config/${x}"
    ) 
 ++ forEach [ 
      "crispy-doom"
      "dolphin-emu"
      "DoomRunner"
      "duckstation"
      "Flatpak"
      "Games"
      "kdenlive"
      "keyrings"
      "mime"
      "mpd"
      "PrismLauncher"
      "Steam"
      "Terraria"
      "zoxide"
      "zplug"
      "zsh" ] (
      x: ".local/share/${x}"
    )
 ++ [ ".ssh" ".var" ".mozilla" ];

 home.persistence."/persist/home/starry".allowOther = true;
}

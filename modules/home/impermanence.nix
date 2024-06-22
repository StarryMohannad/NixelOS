{ lib, ...}:

{
 home.persistence."/persist/home/starry".directories = [
   "dl/persist"
   "sync"
   "proj"

   ".local/persist"
   ".local/state/syncthing"
   ".cache/flatpak"
 ]
 ++ lib.forEach [
     "keepassxc"
     "syncthing"
     "Thunar" ] ( 
      x: ".config/${x}"
    ) 
 ++ lib.forEach [ 
      "flatpak"
      "keyrings"
      "mime"
      "mpd" ] (
      x: ".local/share/${x}"
    )
 ++ [ ".var" ".mozilla" ];

 home.persistence."/persist/home/starry".allowOther = true;
}

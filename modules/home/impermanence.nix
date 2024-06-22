{ lib, ...}:

{
 home.persistence."/persist/home/starry".directories = [
   ".local/persist"
   ".local/state/syncthing"
   ".cache/flatpak"
   ".cache/keepassxc"
 ]
 ++ lib.forEach [
     "keepassxc"
     "syncthing" ] ( 
      x: ".config/${x}"
    ) 
 ++ lib.forEach [ 
      "flatpak"
      "keyrings" ] (
      x: ".local/share/${x}"
    )
 ++ [ ".var" ".mozilla" ];

 home.persistence."/persist/home/starry".allowOther = true;
}

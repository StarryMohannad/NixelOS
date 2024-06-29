{ lib, ...}:

{
 home.persistence."/persist/home/starry".directories = [
   ".local/persist"
   ".cache/flatpak"
 ]
 ++ lib.forEach [ 
      "flatpak"
      "keyrings" ] (
      x: ".local/share/${x}"
    )
 ++ [ ".var" ".mozilla" ];

 home.persistence."/persist/home/starry".allowOther = true;
}

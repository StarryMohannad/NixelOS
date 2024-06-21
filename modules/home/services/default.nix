{ config, pkgs, ... }:

{
 imports = [
   ./mpd.nix
   ./syncthing.nix
 ];
}


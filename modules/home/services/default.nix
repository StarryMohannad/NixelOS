{ config, pkgs, ... }:

{
 imports = [
   ./gpg-agent.nix
   ./mpd.nix
   ./syncthing.nix
 ];
}


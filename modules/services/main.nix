{ config, pkgs, ... }:

{

 services.syncthing.enable = true;

 imports = [
   ./mpd.nix
   ./gpg-agent.nix
 ];
}


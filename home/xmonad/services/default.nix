{ config, pkgs, ... }:

{
 imports = [
   ./mpd.nix
   ./gpg-agent.nix
 ];

 services.syncthing.enable = true;
}


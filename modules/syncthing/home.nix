{ pkgs, config, ... }:

{
 imports = [
   ./home-sub/impermanence.nix
 ];

 services.syncthing.enable = true;
}

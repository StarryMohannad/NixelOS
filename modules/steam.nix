{ config, pkgs, ... }:

{
 nixpkgs.config.allowUnfree = true;
 programs.steam.enable = true;
 programs.gamemode.enable = true;
}



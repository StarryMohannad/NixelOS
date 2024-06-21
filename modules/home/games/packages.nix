{ config, pkgs, ... }:

{
 config.home.packages = with pkgs; [
   dolphin-emu
   duckstation
   pcsx2

   crispy-doom
   doomrunner
   gzdoom
   prismlauncher
 ];
}

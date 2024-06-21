{ config, pkgs, ... }:

{
 config.home.packages = [
   dolphin-emu
   duckstation
   pcsx2

   crispy-doom
   doomrunner
   gzdoom
   prismlauncher
 ];
}

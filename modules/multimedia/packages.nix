{ config, pkgs, ... }:

{
 config.home.packages = with pkgs; [
   aseprite
   gimp
   kdenlive
   obs-studio
 ];
}

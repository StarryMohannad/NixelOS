{ pkgs, config, lib, ... }:

{
 programs.rofi.enable = true;

 programs.rofi.font = lib.mkForce "FiraCode Nerd Font 11";
 programs.rofi.plugins = [
   pkgs.rofi-calc
   pkgs.rofi-emoji
 ];
}

{ pkgs, lib, config, ... }:

{
 gtk.enable = true;
 programs.rofi.font = lib.mkForce "FiraCode Nerd Font 11";
 stylix.opacity.terminal = 0.8;
}
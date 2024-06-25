{ config, pkgs, ... }:

{
 config.home.packages = with pkgs; [
   luajitPackages.lua-utils-nvim
 ];
}

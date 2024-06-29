{ config, pkgs, ... }:

{
 config.home.packages = with pkgs; [
   neofetch
   nitch
   pfetch
 ];
}

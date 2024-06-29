{ config, pkgs, ... }:

{
 config.home.packages = with pkgs; [ keepassxc ];

 config.home.persistence."/persist/home/starry".directories [
   ".config/keepassxc"
   ".cache/keepassxc"
 ];
}

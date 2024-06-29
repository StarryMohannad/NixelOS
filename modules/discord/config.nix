{ config, pkgs, ... }:

{
 config.home.packages = with pkgs; [ vesktop ];
 config.home.persistence."/persist/home/starry".directories = [ ".config/vesktop" ];
}

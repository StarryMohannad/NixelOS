{ config, pkgs, ... }:

{
 programs.gpg.enable = true;
 programs.gpg.homedir = "${config.xdg.dataHome}/gnupg";
}

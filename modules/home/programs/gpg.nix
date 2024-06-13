{ config, pkgs, ... }:

{
 programs.gpg.enable = true;
 programs.gpg.homedir = "${config.home.homeDirectory}/sync/etc/gnupg";
}

{ config, pkgs, ... }:

{
 programs.gpg.enable = true;
 programs.gpg.homedir = "${config.home.homeDirectory}/Sync/Other/gnupg";
}

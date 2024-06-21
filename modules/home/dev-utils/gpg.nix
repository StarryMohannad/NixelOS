{ config, pkgs, ... }:

{
 programs.gpg.enable = true;
 services.gpg-agent.enable = true;

 programs.gpg.homedir = "${config.home.homeDirectory}/sync/etc/gnupg";

 services.gpg-agent.pinentryPackage = pkgs.pinentry-gtk2;
 services.gpg-agent.enableSshSupport = true;
 services.gpg-agent.enableZshIntegration = true;
}

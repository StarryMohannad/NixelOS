{ config, pkgs, ... }:

{
 services.gpg-agent.enable = true;
 services.gpg-agent.pinentryPackage = pkgs.pinentry-gtk2;
 services.gpg-agent.enableSshSupport = true;
 services.gpg-agent.enableZshIntegration = true;
}

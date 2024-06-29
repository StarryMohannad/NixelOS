{ config, pkgs, ... }:

{
 programs.gnupg.agent.enable = true;
 services.openssh.enable = true;

 programs.gnupg.agent.enableSSHSupport = true;
}

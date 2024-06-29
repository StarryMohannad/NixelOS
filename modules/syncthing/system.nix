{ config, pkgs, ... }:

{
 config.networking.firewall.allowedTCPPorts = [ 8384 22000 ];
 config.networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}

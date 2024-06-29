{ config, pkgs, ... }:

{
 config.networking.networkmanager.enable = true;
 config.networking.firewall.enable = true;
 config.users.users."starry".extraGroups = [ "networkmanager" ];
}

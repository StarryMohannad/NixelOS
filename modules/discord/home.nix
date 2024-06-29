{ config, pkgs, ... }:

{
 import = [ ./config.nix ];
 services.arrpc.enable = true;
}

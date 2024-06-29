{ config, pkgs, ... }:

{
 imports = [ ./config.nix ];
 services.arrpc.enable = true;
}

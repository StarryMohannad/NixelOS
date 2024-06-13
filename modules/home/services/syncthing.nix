{ pkgs, config, ... }:

{
 services.syncthing.enable = true;
 
 services.syncthing.user = "Starframe";

 services.syncthing.dataDir = "${config.home.homeDirectory}/sync/.syncthing/data";
 services.syncthing.configDir = "${config.home.homeDirectory}/sync/.syncthing/data";
}

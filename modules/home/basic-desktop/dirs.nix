{ inputs, config, pkgs, ... }:

{
 xdg.userDirs.enable = true;

 xdg.userDirs.desktop = "${config.home.homeDirectory}/.local/Desktop";
 xdg.userDirs.publicShare = "${config.home.homeDirectory}/.local/Public";
 xdg.userDirs.templates = "${config.home.homeDirectory}/.local/Templates";

 xdg.userDirs.documents = "${config.home.homeDirectory}/sync/docs";
 xdg.userDirs.music = "${config.home.homeDirectory}/sync/mus";
 xdg.userDirs.pictures = "${config.home.homeDirectory}/sync/pics";
 xdg.userDirs.videos = "${config.home.homeDirectory}/sync/vids";

 xdg.userDirs.download = "${config.home.homeDirectory}/dl";
}

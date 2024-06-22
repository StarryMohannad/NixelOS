{ inputs, config, pkgs, ... }:

{
 xdg.userDir.senable = true;

 xdg.userDir.desktop = "${config.home.homeDirectory}/.local/Desktop";
 xdg.userDir.publicShare = "${config.home.homeDirectory}/.local/Public";
 xdg.userDir.templates = "${config.home.homeDirectory}/.local/Templates";

 xdg.userDir.documents = "${config.home.homeDirectory}/sync/docs";
 xdg.userDir.music = "${config.home.homeDirectory}/sync/mus";
 xdg.userDir.pictures = "${config.home.homeDirectory}/sync/pics";
 xdg.userDir.videos = "${config.home.homeDirectory}/sync/vids";

 xdg.userDir.download = "${config.home.homeDirectory}/dl";
}

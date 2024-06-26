{ config, pkgs, ... }:

{
 services.mpd.enable = true;

 services.mpd.musicDirectory = "${config.home.homeDirectory}/sync/mus";
 services.mpd.extraConfig = ''
   audio_output {
     type "pipewire"
     name "PipeWire Sound Server"
   }
 '';

 services.mpd-discord-rpc.enable = true;
}

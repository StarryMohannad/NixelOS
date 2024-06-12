{ config, pkgs, ... }:

{
 services.xserver.displayManager.sessionCommands =
  ''
    xset -dpms  # Disable Energy Star, as we are going to suspend anyway and it may hide "success" on that
    xset s blank # `noblank` may be useful for debugging
    xset s 300 # seconds
     ${pkgs.lightlocker}/bin/light-locker --idle-hint &
  '';

 systemd.targets.hybrid-sleep.enable = true;

 services.logind.extraConfig =
   ''
     IdleAction=hybrid-sleep
     IdleActionSec=20s
   '';

 systemd.tmpfiles.rules = [
   "d /persist/home/ 0777 root root -"
   "d /presist/home/starry 0700 starry wheel -"
 ];
}

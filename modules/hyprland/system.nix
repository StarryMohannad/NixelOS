{ config, pkgs, ... }:

{
 # SDDM as the Display Manager
 services.displayManager.sddm.enable = true;
 services.displayManager.sddm.wayland.enable = true;

 programs.hyprland.enable = true;
 programs.hyprland.xwayland.enable = true;

 # XDG Portal
 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
 xdg.portal.config.common.default = "*";

 # Polkit
 systemd.user.services.polkit-gnome-authentication-agent-1 = {
   description = "polkit-gnome-authentication-agent-1";
   wantedBy = [ "graphical-session.target" ];
   wants = [ "graphical-session.target" ];
   after = [ "graphical-session.target" ];
   serviceConfig = {
     Type = "simple";
     ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
     Restart = "on-failure";
     RestartSec = 1;
     TimeoutStopSec = 10;
   };
 };

 security.pam.services.hyprlock = {}; # Hyprlock PAM
}

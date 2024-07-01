{ inputs, config, pkgs, ... }:

{
 imports = [
   ./system-sub/impermanence.nix
   ./system-sub/locale.nix
   ./system-sub/network.nix
   ./system-sub/packages.nix
   ./system-sub/routines.nix
   ./system-sub/sound.nix
   ./system-sub/theme.nix
   ./system-sub/user.nix
 ];

 # Use the systemd-boot EFI boot loader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

 networking.hostName = "starframe"; # Define your hostname.

 # Set your time zone.
 time.timeZone = "Asia/Amman";

 # Enable GVFS
 services.gvfs.enable = true;

 programs.mtr.enable = true;
 security.polkit.enable = true;
 nix.settings.experimental-features = [ "nix-command" "flakes"  ]; 
}

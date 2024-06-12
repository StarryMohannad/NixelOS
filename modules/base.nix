{ inputs, config, pkgs, ... }:

{
 # Use the systemd-boot EFI boot loader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

 networking.hostName = "starframe"; # Define your hostname.
 networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

 # Set your time zone.
 time.timeZone = "Asia/Amman";

 # Select internationalisation properties.
 i18n.defaultLocale = "en_US.UTF-8";

 # Enable sound.
 services.pipewire = {
   enable = true;
   pulse.enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
 };

 # Enable Flatpaks
 services.flatpak.enable = true;
 services.gvfs.enable = true;

 # Firewall
 networking.firewall.enable = true;

 # Configure keymap in X11
 services.xserver.xkb.layout = "us,ara";
 services.xserver.xkb.options = "grp:win_space_toggle";

 # Themes :DD
 stylix.enable = true;
 stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
 stylix.image = ../../wallpaper.png;
}

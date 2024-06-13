{ inputs, config, pkgs, ... }:

{
 imports = [ ./impermanence.nix ]

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

 # Common Packages
 environment.systemPackages = with pkgs; [
   home-manager
   pkgsi686Linux.gperftools
   xorg.libpthreadstubs
   p7zip
   unzip
   vim
   util-linux
   wget
   killall
   tree
   lightlocker
   libnotify
   libdrm
   libglvnd
   libstdcxx5
   librttopo
 ];

 # Firewall
 networking.firewall.enable = true;
 
 # Enable Ports for Syncthing
 networking.firewall.allowedTCPPorts = [ 8384 22000 ];
 networking.firewall.allowedUDPPorts = [ 22000 21027 ];

 # Configure keymap in X11
 services.xserver.xkb.layout = "us,ara";
 services.xserver.xkb.options = "grp:win_space_toggle";

 # Themes :DD
 stylix.enable = true;
 stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
 stylix.image = ../wallpaper.png;

 # Define a user account. Don't forget to set a password with ‘passwd’.
 programs.zsh.enable = true;
 users.users."starry" = {
   isNormalUser = true;
   description = "StarryMohannad";
   extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
   shell = pkgs.zsh;

   # TODO: replace the password with your password ;)
   hashedPassword="$6$U9CycjFVXgPJZ.pr$ciJPJ6SMSSxGyQyLMUJwa6RaWLypHR3kvKW9.xvncU33.N1QnLEWgOfVhjxpjpBMGx1C.aG6Lzr.bhUxsEEko.";
 };
}
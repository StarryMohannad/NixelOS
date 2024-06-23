{ inputs, config, pkgs, ... }:

{
 imports = [ ./impermanence.nix ];

 # Use the systemd-boot EFI boot loader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

 networking.hostName = "starframe"; # Define your hostname.
 networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

 hardware.bluetooth.enable = true; # enables support for Bluetooth
 hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
 services.blueman.enable = true;

 # Set your time zone.
 time.timeZone = "Asia/Amman";

 # Select internationalisation properties.
 i18n.defaultLocale = "en_US.UTF-8";

 i18n.extraLocaleSettings = {
   LC_ADDRESS = "en_CA.UTF-8";
   LC_IDENTIFICATION = "en_CA.UTF-8";
   LC_MEASUREMENT = "en_CA.UTF-8";
   LC_MONETARY = "en_CA.UTF-8";
   LC_NAME = "en_CA.UTF-8";
   LC_NUMERIC = "en_CA.UTF-8";
   LC_PAPER = "en_CA.UTF-8";
   LC_TELEPHONE = "en_CA.UTF-8";
   LC_TIME = "en_CA.UTF-8";
 };

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
   polkit_gnome
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

 stylix.cursor.size = 24;

 stylix.fonts.monospace.package = pkgs.nerdfonts;
 stylix.fonts.monospace.name = "FiraCode Nerd Font";

 stylix.fonts.sansSerif.package = pkgs.nerdfonts;
 stylix.fonts.sansSerif.name = "FiraCode Nerd Font";

 stylix.fonts.serif.package = pkgs.nerdfonts;
 stylix.fonts.serif.name = "FiraCode Nerd Font";

 
 security.polkit.enable = true;

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

 # Define a user account. Don't forget to set a password with ‘passwd’.
 programs.zsh.enable = true;
 users.users."starry" = {
   isNormalUser = true;
   description = "StarryMohannad";
   extraGroups = [ "adbusers" "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
   shell = pkgs.zsh;

   # TODO: replace the password with your password ;)
   hashedPassword="$6$U9CycjFVXgPJZ.pr$ciJPJ6SMSSxGyQyLMUJwa6RaWLypHR3kvKW9.xvncU33.N1QnLEWgOfVhjxpjpBMGx1C.aG6Lzr.bhUxsEEko.";
 };

 nix.settings.auto-optimise-store = true;
 nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 30d";
 };

 nix.settings.experimental-features = [ "nix-command" "flakes"  ]; 
 
 programs.adb.enable = true;

 system.autoUpgrade = {
   enable = true;
   flake = inputs.self.outPath;
   flags = [
     "--upgrade"
     "-L"
   ];
   dates = "09:00";
   randomizedDelaySec = "45min";
 };
}

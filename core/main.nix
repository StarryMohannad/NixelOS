{ inputs, config, lib, pkgs, ... }:
{
 imports = [ ../hosts/15s-eq2009ne.nix ];

 # Use the systemd-boot EFI boot loader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

 boot.initrd.postDeviceCommands = lib.mkAfter ''
   mkdir /btrfs_tmp
   mount /dev/root_vg/root /btrfs_tmp
   if [[ -e /btrfs_tmp/root ]]; then
       mkdir -p /btrfs_tmp/old_roots
       timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
       mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
   fi

   delete_subvolume_recursively() {
       IFS=$'\n'
       for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
           delete_subvolume_recursively "/btrfs_tmp/$i"
       done
       btrfs subvolume delete "$1"
   }

   for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
       delete_subvolume_recursively "$i"
   done

   btrfs subvolume create /btrfs_tmp/root
   umount /btrfs_tmp
 '';

 fileSystems."/persist".neededForBoot = true;
 environment.persistence."/persist/system".hideMounts = true;
 environment.persistence."/persist/system".directories = [
   "/etc/nixos"
   "/etc/NetworkManager/system-connections"
   "/var/log"
   "/var/lib/bluetooth"
   "/var/lib/nixos"
   "/var/lib/systemd/coredump"
   { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
 ];
 environment.persistence."/persist/system".files = [
   "/etc/machine-id"
   { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
 ];

 programs.fuse.userAllowOther = true;

 programs.nix-ld.enable = true;
 programs.nix-ld.libraries = with pkgs; [
   # Add any missing dynamic libraries for unpackaged programs
   # here, NOT in environment.systemPackages
 ];

 # networking.hostName = "nixos"; # Define your hostname.
 networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

 # Set your time zone.
 time.timeZone = "Asia/Amman";

 # Select internationalisation properties.
 i18n.defaultLocale = "en_US.UTF-8";

 # Enable the X11 windowing system.
 services.xserver.enable = true;

 services.xserver.displayManager.lightdm.enable = true;
 services.xserver.displayManager.lightdm.extraConfig = ''user-authority-in-system-dir = true'';

 services.xserver.windowManager.xmonad.enable = true;
 services.xserver.windowManager.xmonad.enableContribAndExtras = true;

 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 xdg.portal.config.common.default = "*";

 # Configure keymap in X11
 services.xserver.xkb.layout = "us,ara";
 services.xserver.xkb.options = "grp:win_space_toggle";

 # Enable sound.
 services.pipewire = {
   enable = true;
   pulse.enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
 };

 # Enable touchpad support (enabled default in most desktopManager).
 services.libinput.enable = true;

 # Define a user account. Don't forget to set a password with ‘passwd’.
 programs.zsh.enable = true;
 users.users."starry" = {
   isNormalUser = true;
   description = "StarryMohannad";
   extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
   shell = pkgs.zsh;

   hashedPassword="$6$U9CycjFVXgPJZ.pr$ciJPJ6SMSSxGyQyLMUJwa6RaWLypHR3kvKW9.xvncU33.N1QnLEWgOfVhjxpjpBMGx1C.aG6Lzr.bhUxsEEko.";
 };

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

 # Enable Flatpaks
 services.flatpak.enable = true;
 services.gvfs.enable = true;

 # Steam
 nixpkgs.config.allowUnfree = true;
 programs.steam.enable = true;
 programs.gamemode.enable = true;

 # Some programs need SUID wrappers, can be configured further or are
 # started in user sessions.
 programs.mtr.enable = true;
 programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
 };

 # List services that you want to enable:

 # Enable the OpenSSH daemon.
 services.openssh.enable = true;

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

 stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
 stylix.image = ./wallpaper.png;

 stylix.cursor.package = pkgs.bibata-cursors;
 stylix.cursor.name = "Bibata-Modern-Ice";
 stylix.cursor.size = 24;

 stylix.fonts.monospace.package = pkgs.nerdfonts;
 stylix.fonts.monospace.name = "FiraCode Nerd Font";

 stylix.fonts.sansSerif.package = pkgs.nerdfonts;
 stylix.fonts.sansSerif.name = "FiraCode Nerd Font";

 stylix.fonts.serif.package = pkgs.nerdfonts;
 stylix.fonts.serif.name = "FiraCode Nerd Font";

 stylix.fonts.sizes.applications = 11;
 stylix.fonts.sizes.desktop = 11;
 stylix.fonts.sizes.popups = 8;
 stylix.fonts.sizes.terminal = 11;

 stylix.enable = true;

 # Open ports in the firewall.
 # networking.firewall.allowedTCPPorts = [ ... ];
 # networking.firewall.allowedUDPPorts = [ ... ];
 # Or disable the firewall altogether.
 networking.firewall.enable = true;
 networking.firewall.allowedTCPPorts = [ 8384 22000 ];
 networking.firewall.allowedUDPPorts = [ 22000 21027 ];

 home-manager.extraSpecialArgs = {inherit inputs;};
 home-manager.users = {
   "starry" = import ../home/xmonad/default.nix;
 };
 
 # Copy the NixOS configuration file and link it from the resulting system
 # (/run/current-system/configuration.nix). This is useful in case you
 # accidentally delete configuration.nix.
 # system.copySystemConfiguration = true;

 # This option defines the first version of NixOS you have installed on this particular machine,
 # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
 #
 # Most users should NEVER change this value after the initial install, for any reason,
 # even if you've upgraded your system to a new NixOS release.
 #
 # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
 # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
 # to actually do that.
 #
 # This value being lower than the current NixOS release does NOT mean your system is
 # out of date, out of support, or vulnerable.
 #
 # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
 # and migrated your data accordingly.
 #
 # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
 system.stateVersion = "24.05"; # Did you read the comment?
}


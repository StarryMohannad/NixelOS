{ inputs, config, lib, pkgs, ... }:
{
 imports = [ 
   ../hosts/15s-eq2009ne.nix

   ./impermanence.nix
   ./fonts.nix
   
   ../modules/system/default.nix
   ../modules/system/xmonad-laptop-power.nix
 ];

 # Enable the X11 windowing system.
 services.xserver.enable = true;

 services.xserver.displayManager.lightdm.enable = true;
 services.xserver.displayManager.lightdm.extraConfig = ''user-authority-in-system-dir = true'';

 services.xserver.windowManager.xmonad.enable = true;
 services.xserver.windowManager.xmonad.enableContribAndExtras = true;

 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 xdg.portal.config.common.default = "*";

 # Enable touchpad support (enabled default in most desktopManager).
 services.libinput.enable = true;

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


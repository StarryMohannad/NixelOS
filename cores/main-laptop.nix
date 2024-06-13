{ inputs, config, lib, pkgs, ... }:
{
 imports = [ 
   ../hosts/15s-eq2009ne.nix

   ../modules/system/base.nix
   ../modules/system/displaymanager-fonts.nix
   ../modules/system/steam.nix
   ../modules/system/xmonad.nix
   ../modules/system/xmonad-laptop-power.nix
 ];

 # Enable touchpad support (enabled default in most desktopManager).
 services.libinput.enable = true;

 # Some programs need SUID wrappers, can be configured further or are
 # started in user sessions.
 programs.mtr.enable = true;
 programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
 };

 # Enable the OpenSSH daemon.
 services.openssh.enable = true;

 home-manager.extraSpecialArgs = {inherit inputs;};
 home-manager.users = {
   "starry" = import ../home/main-laptop.nix;
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

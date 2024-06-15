{ inputs, config, pkgs, ... }:

{
 # Home Manager needs a bit of information about you and the paths it should
 # manage.
 #home.username = "starry";
 #home.homeDirectory = "/home/starry";

 imports = [
   inputs.impermanence.nixosModules.home-manager.impermanence

   ../../modules/home/backend.nix
   ../../modules/home/impermanence.nix
   ../../modules/home/packages.nix
   ../../modules/home/theme.nix
   ../../modules/home/dirs.nix

   ../../modules/home/desktop/default.nix
   ../../modules/home/programs/default.nix
   ../../modules/home/services/default.nix
   ../../modules/home/shell/default.nix
   ../../modules/home/hyprland.nix
 ];

 programs.kitty.enable = true;

 # This value determines the Home Manager release that your configuration is
 # compatible with. This helps avoid breakage when a new Home Manager release
 # introduces backwards incompatible changes.
 #
 # You should not change this value, even if you update Home Manager. If you do
 # want to update the value, then make sure to first check the Home Manager
 # release notes.
 home.stateVersion = "24.05"; # Please read the comment before changing.

 # The home.packages option allows you to install Nix packages into your
 # environment.

 stylix.targets.firefox.profileNames = ["starry"];

 # Let Home Manager install and manage itself.
 programs.home-manager.enable = true;
}

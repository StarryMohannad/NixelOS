{ inputs, config, lib, pkgs, ... }:

{
 # Home Manager needs a bit of information about you and the paths it should
 # manage.
 #home.username = "starry";
 #home.homeDirectory = "/home/starry";

 imports = [ ../cherry/main.nix ];

 # The home.packages option allows you to install Nix packages into your
 # environment.

 # Home Manager is pretty good at managing dotfiles. The primary way to manage
 # plain files is through 'home.file'.
 home.file.".config/xmobar.rc".source = lib.mkForce ../../files/configs/xmobar-laptop.rc;
}

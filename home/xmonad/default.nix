{ inputs, config, pkgs, ... }:

{
 # Home Manager needs a bit of information about you and the paths it should
 # manage.
 #home.username = "starry";
 #home.homeDirectory = "/home/starry";

 imports = [
   inputs.impermanence.nixosModules.home-manager.impermanence

   ./impermanence.nix
   ./packages.nix

   ./environment/main.nix
   ./programs/main.nix
   ./services/main.nix
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
 # plain files is through 'home.file'.
 home.file = {
   ".config/xmonad/xmonad.hs".source = ../files/configs/xmonad.hs;
   ".config/xmobar.rc".source = ../files/configs/xmobar.rc;
 };

 xdg.userDirs = {
   enable = true;

   desktop = "${config.home.homeDirectory}/.local/Desktop";
   publicShare = "${config.home.homeDirectory}/.local/Public";
   templates = "${config.home.homeDirectory}/.local/Templates";

   documents = "${config.home.homeDirectory}/Sync/Documents";
   music = "${config.home.homeDirectory}/Sync/Music";
   pictures = "${config.home.homeDirectory}/Sync/Pictures";
   videos = "${config.home.homeDirectory}/Sync/Videos";

   download = "${config.home.homeDirectory}/Downloads";
 };

 # Home Manager can also manage your environment variables through
 # 'home.sessionVariables'. These will be explicitly sourced when using a
 # shell provided by Home Manager. If you don't want to manage your shell
 # through Home Manager then you have to manually source 'hm-session-vars.sh'
 # located at either
 #
 #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
 #
 # or
 #
 #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
 #
 # or
 #
 #  /etc/profiles/per-user/starry/etc/profile.d/hm-session-vars.sh
 #
 home.sessionVariables = {
   XDG_DATA_HOME = "$HOME/.local/share";
   XDG_CONFIG_HOME = "$HOME/.config";
   XDG_STATE_HOME = "$HOME/.local/state";
   XDG_CACHE_HOME = "$HOME/.cache";

   EDITOR = "nvim";
   BROWSER = "firefox";

   XCOMPOSECACHE = "$HOME/.cache/X11/xcompose";
   HISTFILE = "$HOME/.local/state/bash/history";
   _JAVA_OPTIONS = "-Djava.util.prefs.userRoot='~/.cache/java'";
 };

 # Let Home Manager install and manage itself.
 programs.home-manager.enable = true;
}

{ inputs, config, pkgs, ... }:

{
 xdg.userDirs = {
   enable = true;

   desktop = "${config.home.homeDirectory}/.local/Desktop";
   publicShare = "${config.home.homeDirectory}/.local/Public";
   templates = "${config.home.homeDirectory}/.local/Templates";

   documents = "${config.home.homeDirectory}/sync/docs";
   music = "${config.home.homeDirectory}/sync/mus";
   pictures = "${config.home.homeDirectory}/sync/pics";
   videos = "${config.home.homeDirectory}/sync/vids";

   download = "${config.home.homeDirectory}/downloads";
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
}

{ config, pkgs, ... }:

{
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

{ config, pkgs, ... }:

{
 programs.zsh.enable = true;
 programs.zsh.enableCompletion = true;
 programs.zsh.syntaxHighlighting.enable = true;

 programs.zsh.shellAliases = {
   mkdir = "mkdir -p";

   ls = "eza --long --header --git --icons --group-directories-first";
   ll = "eza --long --header --git --icons --group-directories-first";
   la = "eza --long --header --git --icons --group-directories-first -a";

   g   = "git";
   gi  = "git init";
   ga  = "git add .";
   gc  = "git commit -m";
   gcl = "git clone";
   gp  = "git push";
   gs  = "git submodule";
   gsi = "git submodule init";
   gsa = "git submodule add";
   gsu = "git submodule update";

   cl  = "clear";
   clh = "rm -rf $ZSH/zshistory";
   cld = "rm -rf $HOME/Downloads/*.*";

   wget = "wget --hsts-file='$XDG_DATA_HOME/wget-hsts'";
   nixos-update = "sudo nixos-rebuild --upgrade --flake ~/.local/nf/system/$Nixel && home-manager switch";
 };

 programs.zsh.zplug = {
   enable = true;
   zplugHome = "${config.home.homeDirectory}/.local/share/zplug";
   plugins = [
     { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
   ];
 };

 programs.zsh.history = {
   size = 10000;
   path = "${config.xdg.dataHome}/zsh/history";
 };

 programs.zsh.dotDir = ".config/zsh";
}

{ config, pkgs, lib, ... }:

{
 programs.starship.enable = true;

 programs.starship.enableZshIntegration = true;
 programs.starship.enableBashIntegration = true;

 programs.starship.settings.line_break.disabled = false;
 programs.starship.settings.format = lib.concatStrings [
   "$username"
   "[](bg:#${config.lib.stylix.colors.base0A} fg:#${config.lib.stylix.colors.base09})"
   "$directory"
   "[](fg:#${config.lib.stylix.colors.base0A} bg:#${config.lib.stylix.colors.base0B})"
   "$git_branch"
   "$git_status"
   "[](fg:#${config.lib.stylix.colors.base0B} bg:#${config.lib.stylix.colors.base0D})"
   "$c"
   "$rust"
   "$golang"
   "$nodejs"
   "$php"
   "$java"
   "$kotlin"
   "$haskell"
   "$python"
   "[](fg:#${config.lib.stylix.colors.base0D} bg:#${config.lib.stylix.colors.base03})"
   "$docker_context"
   "$conda"
   "[](fg:#${config.lib.stylix.colors.base03})"
   "[ ](fg:#FFFFFF)"
 ];

 programs.starship.settings.username = {
  show_always = true;
  style_user = "bg:#${config.lib.stylix.colors.base09} fg:#${config.lib.stylix.colors.base05}";
  style_root = "bg:#${config.lib.stylix.colors.base08} fg:#${config.lib.stylix.colors.base05}";
  format = "[ $user ]($style)";
 };

 programs.starship.settings.directory = { 
   style = "fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0A}";
   format = "[ $path ]($style)";
   truncation_length = 3;
   truncation_symbol = "…/";
   substitutions = {
     "Documents" = "󰈙 ";
     "Downloads" = " ";
     "Music" = "󰝚 ";
     "Pictures" = " ";
     "Projects" = "󰲋 ";

     "docs" = "󰈙 ";
     "dls" = " ";
     "mus" = "󰝚 ";
     "pics" = " ";
     "proj" = "󰲋 ";
   };
 }

 programs.starship.settings.git_branch = {
   symbol = " ";
   style = "bg:#${config.lib.stylix.colors.base0B}";
   format = "[[ $symbol $branch ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0B})]($style)";
 };

 programs.starship.settings.git_status = {
   style = "bg:#${config.lib.stylix.colors.base0B}";
   format = "[[($all_status$ahead_behind )](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0B})]($style)";
 }

 programs.starship.settings.nodejs = {
   symbol = "";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.c = {
   symbol = " ";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.rust = {
   symbol = "";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.golang = {
   symbol = "";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.php = {
   symbol = "";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.java = {
   symbol = " ";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.kotlin = {
  symbol = "";
  style = "bg:#${config.lib.stylix.colors.base0D}";
  format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.haskell = {
   symbol = "";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.python = {
   symbol = "";
   style = "bg:#${config.lib.stylix.colors.base0D}";
   format = "[[ $symbol( $version) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base0D})]($style)";
 };

 programs.starship.settings.docker_context = {
  symbol = " ";
  style = "bg:#${config.lib.stylix.colors.base03}";
  format = "[[ $symbol( $context) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base03})]($style)";
 };

 programs.starship.settings.conda = {
  style = "bg:#${config.lib.stylix.colors.base03}";
  format = "[[ $symbol( $environment) ](fg:#${config.lib.stylix.colors.base05} bg:#${config.lib.stylix.colors.base03})]($style)";
 };
}

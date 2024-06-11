{ config, pkgs, ... }:

{
 programs.starship.enable = true;
 programs.starship.enableZshIntegration = true;
 programs.starship.enableBashIntegration = true;
}

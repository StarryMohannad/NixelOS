{ config, pkgs, ... }:

{
 config.programs.zsh.enable = true;
 config.users.users."starry".shell = pkgs.zsh;
}

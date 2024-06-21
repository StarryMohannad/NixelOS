{ config, pkgs, ... }:

{
 description = "Git Version Control";

 programs.git.enable = true;
 programs.git.userName = "StarryMohannad :D";
 programs.git.userEmail = "73769579+StarryMohannad@users.noreply.github.com";

 programs.git.signing = {
   key = "F363A6411AF390BA";
   signByDefault = true;
 };

 programs.git.aliases = {
   c = "commit -am";
   cl = "clone --relative --depth=0";
   p = "push";
 };

 programs.git.extraConfig = {
   init = {
     defaultBranch = "main";
   };
 };
}

{ pkgs, ... }:

{
 nixpkgs.config.allowUnfree = true;  
 home.packages = with pkgs; [
   (nerdfonts.override { fonts = [ "FiraCode" ]; })
   kawkab-mono-font

   scrcpy
   dconf
 ];
}

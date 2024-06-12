{ config, pkgs, ... }:

{
 services.trayer.enable = true;
 
 services.trayer.settings = {
   transparent = true;
   alpha = 0;
   edge = "top";
   align = "right";
   widthtype = "request";
   padding = 5;
   SetDockType = true;
   SetPartialStrut = true;
   expand = true;
   tint = "0x303446";
   height = 15;
 };
}

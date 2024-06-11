{ config, pkgs, ... }:

{
 services.trayer.enable = true;

 services.trayer.settings = {
   alpha = 127;
   edge = "top";
   align = "right";
   widthtype = "request";
   padding = 5;
   SetDockType = true;
   SetPartialStrut = true;
   expand = true;
   tint = "0x282828";
   height = 16;
 };
}

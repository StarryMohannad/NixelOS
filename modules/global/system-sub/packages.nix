{ config, pkgs, ... }:

{
 config.environment.systemPackages = with pkgs; [
   home-manager
   pkgsi686Linux.gperftools
   xorg.libpthreadstubs
   p7zip
   unzip
   vim
   util-linux
   wget
   killall
   tree
   lightlocker
   libnotify
   libdrm
   libglvnd
   libstdcxx5
   librttopo
   polkit_gnome
 ];
}

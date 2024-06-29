{ config, lib, pkgs, ... }:

{
 fileSystems."/persist".neededForBoot = true;
 environment.persistence."/persist/system".hideMounts = true;
 programs.fuse.userAllowOther = true;

 environment.persistence."/persist/system".directories = [
   "/etc/nixos"
   "/etc/NetworkManager/system-connections"
   "/var/log"
   "/var/lib/bluetooth"
   "/var/lib/nixos"
   "/var/lib/flatpak"
   "/var/lib/systemd/coredump"
   { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
 ];

 environment.persistence."/persist/system".files = [
   "/etc/machine-id"
   { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
 ];
}

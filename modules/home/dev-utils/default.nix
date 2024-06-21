{ config, pkgs, ... }:

{
 description = "developer tools... only git for version control and gpg for verification";

 imports = [
   ./git.nix
   ./gpg.nix
 ];
}

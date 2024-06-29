{ config, inputs, ... }:

{

 nix.settings.auto-optimise-store = true;
 nix.gc.automatic = true;
 nix.gc.dates = "weekly";
 nix.gc.options = "--delete-older-than 30d";

 system.autoUpgrade.enable = true;
 system.autoUpgrade.flake = inputs.self.outPath;
 system.autoUpgrade.flags = [
   "--upgrade"
   "-L"
 ];
 system.autoUpgrade.dates = "09:00";
 system.autoUpgrade.randomizedDelaySec = "45min";
}

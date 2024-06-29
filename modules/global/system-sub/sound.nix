{ config, pkgs, ... }:

{
 services.pipewire.enable = true;

 services.pipewire.pulse.enable = true;
 services.pipewire.alsa.enable = true;
 services.pipewire.alsa.support32Bit = true;
}

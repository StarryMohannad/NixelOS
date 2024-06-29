{ config, lib, ... }:

{
 config.home.persistence."/persist/home/starry".directories = [ ".ssh" ];
}

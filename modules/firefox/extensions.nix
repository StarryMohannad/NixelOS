{ config, inputs, ... }:

{
 programs.firefox.profiles.starry.extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
  canvasblocker
  clearurls
  control-panel-for-twitter 
  indie-wiki-buddy
  keepassxc-browser
  return-youtube-dislikes
  sponsorblock
  startpage-private-search
  stylus
  ublock-origin
 ];
}

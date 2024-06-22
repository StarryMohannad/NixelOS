{ config, inputs, ... }:

{
 programs.firefox.profiles.starry.extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
  clearurls
  indie-wiki-buddy
  keepassxc-browser
  return-youtube-dislikes
  startpage-private-search
  stylus
  ublock-origin
 ];
}

{ config, inputs, ... }:

{
 programs.firefox.profiles."starry".arkenfox = {
   enable = true;
   "0000".enable = true;
   "0100".enable = true;
   "0200".enable = true;
   "0300".enable = true;
   "0400".enable = true;
   "0600".enable = true;
   "0700".enable = true;
   "0800".enable = true;
   "0900".enable = true;
   "1000".enable = true;
   "1200".enable = true;
   "1600" = {
      enable = true;
      "1602"."network.http.referer.XOriginTrimmingPolicy".value = 0;
   };
   "1700".enable = true;
   "2000".enable = true;
   "2400".enable = true;
   "2600".enable = true;
   "2700".enable = true;
   "2800" = {
     enable = true;
     "2815"."privacy.clearOnShutdown.cookies".value = 0;
     "2815"."privacy.clearOnShutdown.offlineApps".value = 0;
     "2815"."privacy.clearOnShutdown.sessions".value = 0;
     "2815"."privacy.clearOnShutdown_v2.cookiesAndStorage".value = 0;
   };
   "4000".enable = true;
   "4500".enable = true;
   "5000".enable = true;
   "5500".enable = true;
   "6000".enable = true;
   "7000".enable = true;
   "8000".enable = true;
 };
 
 programs.firefox.profiles."starry".settings = {
   "browser.firefox-view.search.enabled" = false;
   "browser.urlbar.quicksuggest.enabled" = false;
   "browser.urlbar.suggest.topsites" = false;
   "browser.urlbar.suggest.history" =  false;
   "signon.prefillForms" = false;
   "browser.urlbar.autoFill" = false;
   "keyword.enabled" = true;
   "network.cookie.lifetimePolicy" = 0;
   "dom.webnotifications.serviceworker.enabled" = false;
   "dom.push.enabled" = false;
   "extensions.pocket.enabled" = false;
   "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
   "network.http.referer.XOriginPolicy" = 0;
   "identity.fxaccounts.enabled" = false;
   "ui.context_menus.after_mouseup" = true;
 };

 stylix.targets.firefox.profileNames = ["starry"];
}

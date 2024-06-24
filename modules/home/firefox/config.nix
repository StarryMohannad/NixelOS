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
     "2815"."privacy.clearOnShutdown.cookies".value = false;
     "2815"."privacy.clearOnShutdown.offlineApps".value = false;
     "2815"."privacy.clearOnShutdown.sessions".value = false;
     "2815"."privacy.clearOnShutdown_v2.cookiesAndStorage".value = false;
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
   "browser.urlbar.autoFill" = false;
   "browser.urlbar.quicksuggest.enabled" = false;
   "browser.urlbar.suggest.history" =  false;
   "browser.urlbar.suggest.topsites" = false;
   "dom.push.enabled" = false;
   "dom.webnotifications.serviceworker.enabled" = false;
   "extensions.pocket.enabled" = false;
   "general.autoScroll" = true;
   "identity.fxaccounts.enabled" = false;
   "keyword.enabled" = true;
   "network.cookie.lifetimePolicy" = 0;
   "network.http.referer.XOriginPolicy" = 0;
   "signon.prefillForms" = false;
   "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
   "ui.context_menus.after_mouseup" = true;
 };

 stylix.targets.firefox.profileNames = ["starry"];
}

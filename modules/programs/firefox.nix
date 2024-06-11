{ config, pkgs, inputs, ... }:

{
 programs.firefox.enable = true;

 programs.firefox.profiles.starry.extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
   ublock-origin
   indie-wiki-buddy
   return-youtube-dislikes
   keepassxc-browser
 ];

 programs.firefox.profiles.starry.settings = {
   "browser.aboutConfig.showWarning" = false;
   "browser.startup.page" = 0;
   "browser.startup.homepage" = "about:blank";
   "browser.newtabpage.enabled" = false;
   "browser.newtabpage.activity-stream.default.sites" = "";
   "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
   "extensions.htmlaboutaddons.recommendations.enabled" = false;
   "browser.discovery.enabled" = false;
   "datareporting.policy.dataSubmissionEnabled" = false;
   "datareporting.healthreport.uploadEnabled" = false;
   "toolkit.telemetry.unified" = false;
   "toolkit.telemetry.server" = "data: =";
   "toolkit.telemetry.archive.enabled" = false;
   "toolkit.coverage.endpoint.base" = "";
   "browser.ping-centre.telemetry" = false;
   "browser.newtabpage.activity-stream.feeds.telemetry" = false;
   "browser.newtabpage.activity-stream.telemetry" = false;
   "app.shield.optoutstudies.enabled" = false;
   "app.normandy.enabled" = false;
   "app.normandy.api_url" = "";
   "breakpad.reportURL" = "";
   "captivedetect.canonicalURL" = "";
   "network.connectivity-service.enabled" = false;
   "browser.safebrowsing.downloads.remote.enabled" = false;
   "network.prefetch-next" = false;
   "network.dns.disablePrefetch" = true;
   "network.predictor.enabled" = false;
   "network.http.speculative-parallel-limit" = 0;
   "browser.places.speculativeConnect.enabled" = false;
   "network.proxy.socks_remote_dns" = true;
   "browser.urlbar.speculativeConnect.enabled" = false;
   "browser.search.suggest.enabled" = false;
   "browser.urlbar.suggest.searches" = false;
   "browser.urlbar.trending.featureGate" = false;
   "browser.formfill.enable" = false;
   "signon.autofillForms" = false;
   "signon.formlessCapture.enabled" = false;
   "network.auth.subresource-http-auth-allow" = 1;
   "browser.cache.disk.enable" = false;
   "media.memory_cache_max_size" = 65536;
   "browser.sessionstore.privacy_level" = 2;
   "toolkit.winRegisterApplicationRestart" = false;
   "browser.shell.shortcutFavicons" = false;
   "security.ssl.require_safe_negotiation" = true;
   "security.tls.enable_0rtt_data" = false;
   "security.OCSP.require" = true;
   "security.cert_pinning.enforcement_level" = 2;
   "security.remote_settings.crlite_filters.enabled" = true;
   "security.pki.crlite_mode" = 2;
   "dom.security.https_only_mode_send_http_background_request" = false;
   "security.ssl.treat_unsafe_negotiation_as_broken" = true;
   "browser.xul.error_pages.expert_bad_cert" = true;
   "network.http.referer.XOriginTrimmingPolicy" = 0;
   "privacy.userContext.enabled" = true;
   "privacy.userContext.ui.enabled" = true;
   "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
   "media.peerconnection.ice.default_address_only" = true;
   "dom.disable_window_move_resize" = true;
   "browser.helperApps.deleteTempFileOnExit" = true;
   "browser.uitour.enabled" = false;
   "permissions.manager.defaultsUrl" = "";
   "webchannel.allowObject.urlWhitelist" = "";
   "network.IDN_show_punycode" = true;
   "browser.download.useDownloadDir" = false;
   "browser.download.alwaysOpenPanel" = false;
   "browser.download.manager.addToRecentDocs" = false;
   "browser.download.always_ask_before_handling_new_types" = true;
   "extensions.postDownloadThirdPartyPrompt" = false;
   "privacy.sanitize.sanitizeOnShutdown" = true;
   "privacy.cpd.cookies" = false;
   "privacy.sanitize.timeSpan" = 0;
   "privacy.window.maxInnerWidth" = 1600;
   "privacy.window.maxInnerHeight" = 900;
   "privacy.resistFingerprinting.block_mozAddonManager" = true;
   "browser.link.open_newwindow.restriction" = 0;
   "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
   "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
   "browser.messaging-system.whatsNewPanel.enabled" = false;
   "browser.urlbar.showSearchTerms.enabled" = false;
   "security.family_safety.mode" = 0;
   "network.dns.skipTRR-when-parental-control-enabled" = false;
   "browser.urlbar.quicksuggest.enabled" = false;
   "browser.urlbar.suggest.history" = false;
   "signon.prefillForms" = false;
   "browser.urlbar.autoFill" = false;
   "keyword.enabled" = true;
   "network.cookie.lifetimePolicy" = 0;
   "dom.webnotifications.serviceworker.enabled" = false;
   "dom.push.enabled" = false;
   "extensions.pocket.enabled" = false;
   "privacy.clearOnShutdown.cookies" = false;
   "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
   "network.http.referer.XOriginPolicy" = 0;
   "identity.fxaccounts.enabled" = false;
   "ui.context_menus.after_mouseup" = true;
   "webgl.disabled" = false;
 };


}

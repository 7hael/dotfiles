//
// user.js

// disable warning in about:config
user_pref("browser.aboutConfig.showWarning", false);

// disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);

// set startup page to restore previous session
user_pref("browser.startup.page", 3);

// disable some Activity Stream
// ser_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false); // [DEFAULT: false FF89+]
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false); // [FF66+]
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); // [FF83+]
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// set useragent
user_pref("general.platform.override", "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0");

// disable geolocation
user_pref("geo.enabled", false);

// set preferred language for displaying pages regardless system locale
user_pref("intl.accept_languages", "en-US, en");
user_pref("javascript.use_us_english_locale", true); // [HIDDEN PREF]

// disable firefox auto updates
user_pref("app.update.auto", false);
user_pref("app.update.background.scheduling.enabled", false);

// disable system addon updates
// user_pref("extensions.systemAddon.update.enabled", false); // [FF62+]
// user_pref("extensions.systemAddon.update.url", ""); // [FF44+]

// disable recommendation pane in about:addons (uses Google Analytics) 
user_pref("extensions.getAddons.showPane", false); // [HIDDEN PREF]

// disable recommendations in about:addons' Extensions and Themes panes [FF68+]
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// disable personalized Extension Recommendations in about:addons and AMO [FF65+]
user_pref("browser.discovery.enabled", false);

// disable new data submission [FF41+]
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// disable Health Reports
user_pref("datareporting.healthreport.uploadEnabled", false);

// disable telemetry
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false); // see [NOTE]
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false); // [FF55+]
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false); // [FF55+]
user_pref("toolkit.telemetry.updatePing.enabled", false); // [FF56+]
user_pref("toolkit.telemetry.bhrPing.enabled", false); // [FF57+] Background Hang Reporter
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // [FF57+]

// disable Telemetry Coverage
user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
user_pref("toolkit.coverage.endpoint.base", "");

// disable PingCentre telemetry (used in several System Add-ons) [FF57+]
user_pref("browser.ping-centre.telemetry", false);

// disable Studies
user_pref("app.shield.optoutstudies.enabled", false);

// disable Normandy/Shield [FF60+]
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// disable Crash Reports
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false); // [FF44+]

// enforce no submission of backlogged Crash Reports [FF58+]
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false); // [DEFAULT: false]

// disable Captive Portal detection
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false); // [FF52+]

// disable Network Connectivity checks [FF65+]
user_pref("network.connectivity-service.enabled", false);

// enforce disabling of Web Compatibility Reporter [FF56+]
user_pref("extensions.webcompat-reporter.enabled", false); // [DEFAULT: false]

// ??
user_pref("browser.theme.toolbar-theme", 0);

// hide bookmarks tab
user_pref("browser.toolbars.bookmarks.visibility", "never");

// disable Safe Browsing checks for downloads
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");

// disable link prefetching
user_pref("network.prefetch-next", false);

// disable DNS prefetching
user_pref("network.dns.disablePrefetch", true);

// disable predictor / prefetching ***/
user_pref("network.predictor.enabled", false);

// disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);

// set the proxy server to do any DNS lookups when using SOCKS
user_pref("network.proxy.socks_remote_dns", true);

// disable using UNC (Uniform Naming Convention) paths [FF61+]
// ser_pref("network.file.disable_unc_paths", true); // [HIDDEN PREF]

// disable GIO as a potential proxy bypass vector
user_pref("network.gio.supported-protocols", ""); // [HIDDEN PREF]

// disable location bar using search
user_pref("keyword.enabled", false);

// disable location bar domain guessing
user_pref("browser.fixup.alternate.enabled", false);

// display all parts of the url in the location bar ***/
user_pref("browser.urlbar.trimURLs", false);

// disable live search suggestions
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);

// disable location bar making speculative connections [FF56+]
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// disable location bar leaking single words to a DNS provider **after searching** [FF78+]
user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);

// disable location bar contextual suggestions [FF92+]
user_pref("browser.urlbar.suggest.quicksuggest", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);

// disable search and form history
user_pref("browser.formfill.enable", false);

// disable Form Autofill
user_pref("extensions.formautofill.addresses.enabled", false); // [FF55+]
user_pref("extensions.formautofill.available", "off"); // [FF56+]
user_pref("extensions.formautofill.creditCards.available", false); // [FF57+]
user_pref("extensions.formautofill.creditCards.enabled", false); // [FF56+]
user_pref("extensions.formautofill.heuristics.enabled", false); // [FF55+]

// disable coloring of visited links
user_pref("layout.css.visited_links_enabled", false);

// disable auto-filling username & password form fields
user_pref("signon.autofillForms", false);

// disable formless login capture for Password Manager [FF51+] ***/
user_pref("signon.formlessCapture.enabled", false);

// enforce no automatic authentication on Microsoft sites [FF91+] [WINDOWS 10+]
user_pref("network.http.windows-sso.enabled", false); // [DEFAULT: false]

//set download folder
user_pref("browser.download.dir", "~/downloads");

// personal toolbar widgets and addons placement
user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[\"_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action\",\"_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action\",\"_74145f27-f039-47ce-a470-a662b129930a_-browser-action\",\"jid1-kkzogwgsw3ao4q_jetpack-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"home-button\",\"urlbar-container\",\"library-button\",\"sidebar-button\",\"downloads-button\",\"fxa-toolbar-menu-button\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"addon_darkreader_org-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"addon_darkreader_org-browser-action\",\"jid1-kkzogwgsw3ao4q_jetpack-browser-action\",\"_74145f27-f039-47ce-a470-a662b129930a_-browser-action\",\"_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action\",\"_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\",\"widget-overflow-fixed-list\"],\"currentVersion\":17,\"newElementCount\":3}");

// enable userChrome.css changes
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// enable GPU rendering
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("layers.acceleration.force-enabled", true);
user_pref("gfx.webrender.all", true);

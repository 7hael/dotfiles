// user.js

// disable warning in about:config
user_pref("browser.aboutConfig.showWarning", false);

// disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);

// set startup page to restore previous session
user_pref("browser.startup.page", 3);

// disable firefox auto updates
user_pref("app.update.auto", false);
user_pref("app.update.background.scheduling.enabled", false);

// disable recommendation pane in about:addons (uses Google Analytics) 
user_pref("extensions.getAddons.showPane", false); // [HIDDEN PREF]

// disable recommendations in about:addons' Extensions and Themes panes [FF68+]
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// disable personalized Extension Recommendations in about:addons and AMO [FF65+]
user_pref("browser.discovery.enabled", false);

// hide bookmarks tab
user_pref("browser.toolbars.bookmarks.visibility", "never");

// disable Safe Browsing checks for downloads
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");

// disable coloring of visited links
user_pref("layout.css.visited_links_enabled", false);

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

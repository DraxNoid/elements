{ self, inputs, lib, config, pkgs, ...}: 
{
    imports = [
        self.inputs.zen-browser.homeModules.beta
    ];
    
    options = {
        zen-browser.enable = lib.mkEnableOption "enables zen browser";
    };

    config = lib.mkIf config.zen-browser.enable {
       	programs.zen-browser = {
            enable = true;	
            setAsDefaultBrowser = true;
            policies = let
                mkLockedAttrs = builtins.mapAttrs (_: value: {
                    Value = value;
                    Status = "locked";
                });

                mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

                mkExtensionEntry = {
                    id,
                    pinned ? false,
                }: let
                    base = {
                        install_url = mkPluginUrl id;
                        installation_mode = "force_installed";
                    };
                in
                    if pinned
                    then base // {default_area = "navbar";}
                    else base;

                mkExtensionSettings = builtins.mapAttrs (_: entry:
                    if builtins.isAttrs entry
                    then entry
                    else mkExtensionEntry {id = entry;});
            in {
                AutofillAddressEnabled = true;
                AutofillCreditCardEnabled = false;
                DisableAppUpdate = true;
                DisableFeedbackCommands = true;
                DisableFirefoxStudies = true;
                DisablePocket = true;
                DisableTelemetry = true;
                DontCheckDefaultBrowser = true;
                OfferToSaveLogins = false;
                EnableTrackingProtection = {
                    Value = true;
                    Locked = true;
                    Cryptomining = true;
                    Fingerprinting = true;
                };
                SanitizeOnShutdown = {
                    FormData = true;
                    Cache = true;
                };
                ExtensionSettings = mkExtensionSettings {
                    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = mkExtensionEntry {
                        id = "bitwarden-password-manager";
                        pinned = true;
                    };
                    "firefox@ghostery.com" = "ghostery";
                    "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "vimium";
                };
                Preferences = mkLockedAttrs {
                    "browser.aboutConfig.showWarning" = false;
                    "browser.tabs.warnOnClose" = false;
                    "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
                    "browser.tabs.hoverPreview.enabled" = true;
                    "browser.newtabpage.activity-stream.feeds.topsites" = false;
                    "browser.topsites.contile.enabled" = false;
                    "privacy.resistFingerprinting" = true;
                    "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
                    "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
                    "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
                    "privacy.resistFingerprinting.block_mozAddonManager" = true;
                    "privacy.spoof_english" = 1;
                    "privacy.firstparty.isolate" = true;
                    "network.cookie.cookieBehavior" = 5;
                    "dom.battery.enabled" = false;
                    "gfx.webrender.all" = true;
                    "network.http.http3.enabled" = true;
                    "network.socket.ip_addr_any.disabled" = true;
                };
            };
        };
	};		
}
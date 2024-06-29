{ config, pkgs, ... }:

{
 i18n.defaultLocale = "en_US.UTF-8";

 i18n.extraLocaleSettings.LC_ADDRESS = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_IDENTIFICATION = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_MEASUREMENT = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_MONETARY = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_NAME = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_NUMERIC = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_PAPER = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_TELEPHONE = "en_CA.UTF-8";
 i18n.extraLocaleSettings.LC_TIME = "en_CA.UTF-8";
}

{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  #home.username = "starry";
  #home.homeDirectory = "/home/starry";

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./environment/main.nix
    ./programs/main.nix
    ./services/main.nix
  ];

  programs.kitty.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;  
  home.packages = with pkgs; [
    aseprite
    gimp
    kdenlive
    obs-studio

    (discord.override { withVencord = true; })
    keepassxc

    bat
    eza
    mpc-cli
    neofetch
    nitch
    pfetch
    screenfetch
    zoxide

    brightnessctl
    hacksaw
    pamixer
    shotgun

    mpv
    nsxiv
    xfce.thunar
    zathura

    crispy-doom
    dolphin-emu
    doomrunner
    duckstation
    gzdoom
    pcsx2
    prismlauncher

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    kawkab-mono-font

    dconf
    syncthing
    xclip
    xsel

    gxmessage
    dunst
    xwallpaper
    xcompmgr
    xdotool

    xmobar
    dmenu   
  ];

 home.persistence."/persist/home/starry".directories = [
   "Sync"
   "Projects"
   "Downloads/persist"
   ".ssh"
   ".var"
   ".mozilla"
   ".local/nf"
   ".local/share/keyrings"
   ".local/share/gnupg"
   ".local/share/Prismlauncher"
 ];
 home.persistence."/persist/home/starry".allowOther = true;

# Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/xmonad/xmonad.hs".source = ../files/configs/xmonad.hs;
    ".config/xmobar.rc".source = ../files/configs/xmobar.rc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/starry/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

# NixelOS

NixelOS is my collection of configs for NixOS and Home Manager

## <!> ATTENTION <!>

NixelOS is only my personal dotfiles, it might not suit your needs or even run in your machine... however you can use it as an inspiration for your personal configuration. (I won't recommanded it tho because I am still a noobie)

## Features

* Catppuccin Theme (Frappe Flavor)
* Configs for all programs
* Opt-in Impermanence
* Private Firefox Profile

## Contents

here are the contents of this repo

### Flavors

these are the presets of configurations... the only one avalible right now is `cherry` which is the main preset of Nixel featuring a Hyprland Window Manager with all kinds of multimedia and game launchers pre-installed when you activate it

### Modules

* Home
  * basic-desktop: sets up xdg-folders in the home directory
  * dev: sets up things for development
  * firefox: sets up a firefox profile with a modified arkenfox config and a list of plugins
  * games: installs game emulators and launchers with mangohud
  * hyprland: sets up a config for hyprland the Window Manager, waybar, hyprlock and hyprpaper
  * multimedia: installs suite of programs for editing pictures and videos
  * nixvim: sets up a neovim config 
  * shell: sets up the zsh shell with starship
  * global: a shared home config between all flavors
* System
  * global: a shared home config between all flavors
  * hyprland: adds hyprland to sddm
  * virtualization: only adds wayland right now
* disko.nix: just a disk layout... 1mb boot, 500mb kernals, 32gb swap because why not and the rest is a good old btrfs root
* wallpaper.png: wait why is this here ??

### Hosts

configurations for diffrent machines

* 15s-eq2009ne: a configuration for my laptop I will replace it soon so idc

## Installation

to install my poorly put together config pack

1. boot up into a NixOS Live enviorment
if you don't have a NixOS iso you can get one [https://nixos.org/download Here] 

2. clone this repo
by using the following command

```bash
git clone https://github.com/StarryMohannad/NixelOS
```

3. go to the root of the repo and run this command to format your disk

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix --arg device '"/path/to/your/disk"'
```

4. use the nix install command to install NixOS on the Formated disk
(before you install make sure to change the hashed password in your flavor's system.nix to your password by using `mkpasswd`)

```bash
nixos-install --root /mnt --flake /path/to/repo/nixos#flavor
```

5. Congrats :DD

## Special Thanks

I want to thank

* [Sioodmy](https://github.com/sioodmy/dotfiles): for his dotfiles that helped me with the structer of my repo 
* [Biolerplate](https://www.youtube.com/@NoBoilerplate): for convincing me to try NixOS
* [Vimjoyer](https://www.youtube.com/@vimjoyer): for his excellent and helpful tutorials


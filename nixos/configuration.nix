{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

	users.users.madeinheaven91 = {
		isNormalUser = true;
		extraGroups = [ "wheel" "sudo" "networkmanager" "docker" ];
    shell = pkgs.zsh;
	};

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "heaven";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  services.printing.enable = true;

  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    alacritty
    git
    zoxide
    fzf
    pavucontrol
    wl-clipboard
    libnotify
    brightnessctl
    playerctl
    xwayland-satellite
    where-is-my-sddm-theme
  ];

  services.libinput.enable = true;

  services.displayManager = { 
    enable = true;
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        where-is-my-sddm-theme
        kdePackages.qt5compat
        kdePackages.qtmultimedia
        kdePackages.qtsvg
        kdePackages.qtdeclarative
      ];
      theme = "where_is_my_sddm_theme";
    };
  };

  services.displayManager.sessionPackages = with pkgs; [ niri ];  

  services.v2raya.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    autoPrune.flags = [ "--all" ];
    storageDriver = "overlay2";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}


{
  self,
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    self.inputs.minegrub-theme.nixosModules.default
    self.inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    ../../users/deuterium
  ];

  home-manager = {
    extraSpecialArgs = { inherit self inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
  };
  users.users.deuterium.hashedPassword = lib.mkForce "$6$vHhqSvz45B7RtNqo$ZJyeAEYoRFiO9yPuRRlr3RipCWAHOfQwweJvMG.fsyArcwvLI6uMqZ9fa4Vv4LEuwbWEgdrgLvWJY2nVI7LUB1";
  users.users.deuterium.hashedPasswordFile = lib.mkForce null; 
  clan.core.deployment.requireExplicitUpdate = true;

  # Boot
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      grub = {
        minegrub-theme = {
          enable = true;
          splash = "100% Flakes!";
          background = "background_options/1.8  - [Classic Minecraft].png";
          boot-options-count = 4;
        };
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        configurationLimit = 25;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Nix
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Networking
  networking = {
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
    firewall.allowedTCPPorts = [ 5353 ];
  };

  # Hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Experimental = true;
    };
  };

  # Time & Locale
  time.timeZone = "Europe/Amsterdam";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8";
      LC_IDENTIFICATION = "nl_NL.UTF-8";
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_MONETARY = "nl_NL.UTF-8";
      LC_NAME = "nl_NL.UTF-8";
      LC_NUMERIC = "nl_NL.UTF-8";
      LC_PAPER = "nl_NL.UTF-8";
      LC_TELEPHONE = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };
  };

  # Environment
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      vim
      git
      lxqt.lxqt-policykit
      gvfs
      samba
      xdg-desktop-portal
      xdg-desktop-portal-gtk
    ];
  };

  # Services
  services = {
    blueman.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      autoLogin = {
        enable = true;
        user = "deuterium";
      };
    };

    xserver = {
      xkb.layout = "us";
      xkb.variant = "";
    };

    printing.enable = true;

    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    dbus.enable = true;
    gvfs.enable = true;
  };

  # Security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.sddm.enableGnomeKeyring = true;
  };

  # Systemd
  systemd = {
    services = {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };
    user.services.dbus.enable = true;
  };

  # Programs
  programs.hyprland.enable = true;

  # Virtualization
  virtualisation.docker.enable = true;

  # Fonts
  fonts.fontDir.enable = true;

  # Nixpkgs
  nixpkgs.config.allowUnfree = true;

  # System
  system.stateVersion = "24.05";
}

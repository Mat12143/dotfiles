# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, virtualisation, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # GRUB Bootloader
  boot.loader = { 
    efi = { 
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = { 
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking.hostName = "nixos"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking & bluetooth
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # TODO To remove on production
  services.openssh.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matteo = {
    isNormalUser = true;
    description = "Matteo";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install steam
  programs.steam.enable = true; 

  programs.zsh.enable = true;

  # Install docker
  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
     neovim
     git
     stow
     fastfetch
     gcc14
     cargo
     alacritty
     hyprland

     starship
     tmux
     waybar
     wlogout
     wofi
  ];

  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

  # Firewall #TODO maybe enable??
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

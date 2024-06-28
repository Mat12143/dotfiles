{ config, pkgs, ... } :

{
  imports = [
    ./alacritty.nix
    # ./neovim.nix
    # ./starship.nix
    # ./tmux.nix
    # ./waybar.nix
    # ./wlogout.nix
    # ./wofi.nix
    # ./zsh.nix
    # ./hyrpland.nix
  ];

  programs.home-manager.enable = true;
  xdg.enable = true;


  home.username = "matteo";
  home.homeDirectory = "/home/matteo";
  home.stateVersion = "23.11";
}

{ config, pkgs, ... }:

{
  imports = [
    ../modules/base.nix
    ../modules/users.nix
    ../modules/networking.nix
  ];

  system.stateVersion = "25.11";

  ###########################
  #     Docker Service      #
  ###########################
  virtualisation.docker = {
    enable = true;
    autoStart = true;
  }

  users.groups.docker = {};
  users.users.wanderer.extraGroups = [] lib.mkForce ["docker"];

  ###########################
  #      Nginx Service      #
  ###########################

  services.nginx = {
    enable = true;
  }
}

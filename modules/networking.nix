{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" ];
}

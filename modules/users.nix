{ config, pkgs, ... }:

{
  users.users.wanderer = {
    isNormalUser = true;
    description = "wanderer";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  users.users.root.password = "root";
}

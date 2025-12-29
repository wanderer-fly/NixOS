{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.windowManager.hyprland.enable = true;
  
  services.ly.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    foot
    alacritty
    swaylock
    swayidle
    grim
    slurp
    mako
    wl-clipboard
    playerctl
    wf-recorder
  ];
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
}

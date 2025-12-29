{ config, pkgs, ... }:

{
  time.timeZone = "Asia/Hong_Kong";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    keyMap = "us";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    vim
    git wget curl
    fastfetch
    tmux
    htop btop atop
  ];
}

{ config, pkgs, ... }:

let
  user = "wanderer";
  userHome = "/home/${user}";
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = ''
      if [[ -o login ]] && command -v fastfetch > /dev/null; then
        fastfetch
      fi

      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';
  };

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    meslo-lgs-nf
  ];
  
  system.userActivationScripts.zshrc = "touch .zshrc";
  environment.loginShellInit = ''
  '';
  
}

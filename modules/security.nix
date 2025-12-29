{ config, pkgs, ... }:

{
  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  networking.firewall.allowedUDPPorts = [ ];

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  # sudo
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # fail2ban
  
  environment.systemPackages = with pkgs; [
    fail2ban
  ];
  
  systemd.services.fail2ban = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
  };
}

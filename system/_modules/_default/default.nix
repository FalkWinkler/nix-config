{ config, hostname, ... }:
let
  mySystem = config.mySystem;
in
{
  imports = [
    ./nix.nix
    ./sops.nix
    ./users.nix
  ];

  config = {
    networking.hostName = hostname;

    time.timeZone = "Europe/Berlin";

    security = {
      sudo.wheelNeedsPassword = false;
      polkit.enable = true;
    };

    services.displayManager.autoLogin.user = mySystem.adminUser;

    catppuccin = {
      flavor = "mocha";
      accent = "mauve";
    };

    # do not change unless you know what you are doing
    system.stateVersion = "24.11";
    documentation.nixos.enable = false;
  };
}

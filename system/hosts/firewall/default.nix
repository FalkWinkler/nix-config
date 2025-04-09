{ ... }:
{
  imports = [ 
    ./hardware-configuration.nix
    ./_modules # host specific modules
    ../../profiles/server.nix
  ];

  config = {
    myHardware.cpu = "intel";

    mySystem = {
      programs.nh = {
        enable = true;
        flake = "/home/budiman/Github/nix-config";
      };
      services = {
        btrfs-autoscrub = {
          enable = true;
          fileSystems = [ "/" ];
        };
        restic-backup.enable = true;
      };
    };

    services.openssh.listenAddresses = [
      { addr = "10.0.0.114"; }  
    ];

    # sshd failed to start on boot when interface is not ready yet
    systemd.services.sshd = {
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
    };
  };
}

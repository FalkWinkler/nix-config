{  config, lib, pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod" "sr_mod" 
      ];
    };
    kernelModules = [ "kvm-intel" ];  
  };

  # fileSystems = {
  #   "/boot" = {
  #     device = "/dev/disk/by-uuid/C241-FDB6";
  #     fsType = "vfat";
  #     options = [
  #       "fmask=0022"
  #       "dmask=0022"
  #     ];
  #   };
  #   "/" = {
  #     device = "/dev/disk/by-uuid/c85a6137-9a10-4e79-a5a5-86368db22114";
  #     fsType = "ext4";
  #   };
  # };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

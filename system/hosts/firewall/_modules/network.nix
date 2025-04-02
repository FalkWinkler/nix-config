{ ... }:
{
  networking = {
    domain = "home.arpa";
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    useDHCP = false;
  };

  systemd.network = {
    enable = true;   
      links = {
        # rename all interface names to be easier to identify
        # "10-wan0" = {
        #   matchConfig.Path = "pci-0000:03:00.0";
        #   linkConfig.Name = "wan0";
        # };     
        "10-vnet12" = {
          matchConfig.MACAddress = "BC:24:11:0C:65:12";
          linkConfig.Name = "vnet12";
        };
        "10-lan1" = {
          matchConfig.MACAddress = "BC:24:11:2A:2F:6F";
          linkConfig.Name = "lan1";
        };
        "10-vnet10" = {
          matchConfig.MACAddress = "BC:24:11:0C:65:10";
          linkConfig.Name = "vnet10";
        };
        "10-vnet11" = {
          matchConfig.MACAddress = "BC:24:11:0C:65:11";
          linkConfig.Name = "vnet11";
        };

    }; 
  };
}

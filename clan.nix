{
  # Ensure this is unique among all clans you want to use.
  meta.name = "elements";
  meta.domain = "elements.internal";

  inventory.machines = {
    # Define machines here.
    hydrogen = {
        # The 'tags' attribute is used to group machines and assign services to them.
        tags = [ "nixos" "server" ];
    }
  };

  # Docs: See https://docs.clan.lol/services/definition/
  inventory.instances = {

    # Docs: https://docs.clan.lol/services/official/admin/
    # Admin service for managing machines
    # This service adds a root password and SSH access.
    admin = {
      roles.default.tags.all = { };
      roles.default.settings.allowedKeys = {
        # Insert the public key that you want to use for SSH access.
        # All keys will have ssh access to all machines ("tags.all" means 'all machines').
        # Alternatively set 'users.users.root.openssh.authorizedKeys.keys' in each machine
        "helium" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINsUtReTMWZdl4M1t9yg1z2aDrhxdqA4phKgWShRp+wx helium";
      };
    };

    # Docs: https://docs.clan.lol/services/official/zerotier/
    # The lines below will define a zerotier network and add all machines as 'peer' to it.
    # !!! Manual steps required:
    #   - Define a controller machine for the zerotier network.
    #   - Deploy the controller machine first to initialize the network.
    zerotier = {
      # Replace with the name (string) of your machine that you will use as zerotier-controller
      # See: https://docs.zerotier.com/controller/
      # Deploy this machine first to create the network secrets
      roles.controller.machines."__YOUR_CONTROLLER__" = { };
      # Peers of the network
      # tags.all means 'all machines' will joined
      roles.peer.tags.all = { };
    };

    # Docs: https://docs.clan.lol/services/official/tor/
    # Tor network provides secure, anonymous connections to your machines
    # All machines will be accessible via Tor as a fallback connection method
    tor = {
      roles.server.tags.nixos = { };
    };
  };

  # Additional NixOS configuration can be added here.
  # machines/jon/configuration.nix will be automatically imported.
  # See: https://docs.clan.lol/guides/inventory/autoincludes/
  machines = { };
}

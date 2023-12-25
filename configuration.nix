{
  description = "NixOS Raspberry Pi configuration flake";
  outputs = { self, nixpkgs }: {
    nixosConfigurations.rpi = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        {
          config = {
            system = {
              # Disable zstd compression
              build.sdImage.compressImage = false;

              # ... other configs

              stateVersion = "23.10";
            };
          };
        }
      ];
    };
  };
}

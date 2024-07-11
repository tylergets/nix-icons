{
  description = "Description for the project";

  inputs = {
    
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    devicons = {
      url = "github:devicons/devicon";
      flake = false;
    };
  };

  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          devicons = pkgs.callPackage ./devicons.nix { inputs = inputs; };
        };
      };
    };
}

{
  description = "vpython and friends packaged for nix";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {pkgs, ...}: let
        inherit (pkgs) callPackage;
      in {
        packages = rec {
          vpython = callPackage ./pkgs/vpython.nix {
            inherit jupyterlab-vpython jupyter-server-proxy;
          };
          jupyterlab-vpython = callPackage ./pkgs/jupyterlab-vpython.nix {};
          jupyter-server-proxy = callPackage ./pkgs/jupyter-server-proxy.nix {inherit simpervisor;};
          simpervisor = callPackage ./pkgs/simpervisor.nix {};
        };
        formatter = pkgs.alejandra;
      };
    };
}

{
  description = "Nixos flake for maibenben hardware support";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  {
    nixosModules.p477 = import modules/nixos/p477;
  };
}

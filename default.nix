{ nixpkgs ? import <nixpkgs> { }, ... }:
let
  packages = import ./packages/default.nix nixpkgs;
in
{
  pkgs = packages;
  mkInstaller = import ./src/installer.nix nixpkgs;
}

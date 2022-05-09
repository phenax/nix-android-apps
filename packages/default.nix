{ pkgs, ... }@args:
{
  fDroid = pkgs.callPackage ./f-droid/pkg.nix args;
}

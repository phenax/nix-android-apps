let
  nixpkgs = import <nixpkgs> { };
  android = import ./default.nix nixpkgs;
in
nixpkgs.stdenv.mkDerivation {
  name = "test-package-here";
  version = "0.0.0";
  buildInputs = [
    android.pkgs.fDroid
  ];
}

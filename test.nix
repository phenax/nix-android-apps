let
  nixpkgs = import <nixpkgs> { };
  android = import ./default.nix nixpkgs;
in
nixpkgs.stdenv.mkDerivation {
  pname = "test-package-here";
  version = "0.0.0";

  src = ''./test.nix'';
  unpackPhase = ''ls'';
  buildPhase = ''mkdir -p $out && cp ${android.pkgs.fDroid}/app.apk $out/fdroid.apk'';
  installPhase = ''echo 1'';

  buildInputs = [
    android.pkgs.fDroid
  ];
}

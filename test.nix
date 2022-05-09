let
  nixpkgs = import <nixpkgs> { };
  android = import ./default.nix nixpkgs;
in
nixpkgs.stdenv.mkDerivation {
  pname = "test-package-here";
  version = "0.0.0";

  src = ''./test.nix'';
  unpackPhase = ''echo ${android.pkgs."org.fdroid.fdroid".pname}'';
  buildPhase = ''mkdir -p $out && cp ${android.pkgs."org.fdroid.fdroid"}/app.apk $out/fdroid.apk'';
  installPhase = ''echo 1'';

  buildInputs = [
    android.pkgs."org.fdroid.fdroid"
  ];
}

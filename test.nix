with builtins;
let
  nixpkgs = import <nixpkgs> { };
  android = import ./default.nix nixpkgs;
  testPackage = android.pkgs."com.termux.nix";
  packageNames = [
    "com.duckduckgo.mobile.android"
    "com.nutomic.syncthingandroid"
    "org.sufficientlysecure.keychain"
    "dev.msfjarvis.aps"
    "org.liberty.android.freeotpplus"
    "org.fdroid.fdroid"
  ];
  packages = map (p: android.pkgs."${p}") packageNames;
in
nixpkgs.stdenv.mkDerivation {
  pname = "test-package-here";
  version = "0.0.0";

  src = ''./test.nix'';
  unpackPhase = ''echo 1'';
  buildPhase = ''
    mkdir -p $out;
    ${concatStringsSep " ; " (map (p: "cp ${p}/app.apk $out/${p.pname}.apk") packages)}
  '';
  installPhase = ''
    ${concatStringsSep " ; " (map (p: "ls $out/${p.pname}.apk") packages)}
  '';

  buildInputs = [
    packages
  ];
}

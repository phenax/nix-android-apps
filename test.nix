let
  nixpkgs = import <nixpkgs> { };
  android = import ./default.nix nixpkgs;
  packageInstaller = android.mkInstaller {
    name = "android-packages-installer";
    packages = builtins.map (p: android.pkgs."${p}") [
      "com.duckduckgo.mobile.android"
      "com.nutomic.syncthingandroid"
      "org.sufficientlysecure.keychain"
      "dev.msfjarvis.aps"
      "org.liberty.android.freeotpplus"
      "org.fdroid.fdroid"
      "io.github.phenax.owyn"
    ];
  };
in
nixpkgs.mkShell {
  buildInputs = [ packageInstaller ];
}

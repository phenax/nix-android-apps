args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = "dev.msfjarvis.aps";
  versionCode = "11350";
}

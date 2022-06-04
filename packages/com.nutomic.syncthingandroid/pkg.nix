args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = "com.nutomic.syncthingandroid";
  versionCode = "4309";
}

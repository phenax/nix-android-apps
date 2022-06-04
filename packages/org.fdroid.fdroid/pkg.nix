args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = "org.fdroid.fdroid";
  versionCode = "1015052";
}

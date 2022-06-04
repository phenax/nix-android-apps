args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = "com.termux.nix";
  versionCode = "66027";
}

args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = "org.sufficientlysecure.keychain";
  versionCode = "57500";
}

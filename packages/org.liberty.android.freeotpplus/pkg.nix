args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = "org.liberty.android.freeotpplus";
  versionCode = "19";
}

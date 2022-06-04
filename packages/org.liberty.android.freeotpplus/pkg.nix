args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = "org.liberty.android.freeotpplus";
  versionCode = "19";
}

args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = "org.fdroid.fdroid";
  versionCode = "1014050";
}

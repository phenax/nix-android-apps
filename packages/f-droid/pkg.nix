args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  pname = "org.fdroid.fdroid";
  version = "1.15";
  versionCode = "1015050";
}

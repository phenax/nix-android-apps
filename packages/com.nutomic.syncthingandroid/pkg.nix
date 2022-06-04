args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = "com.nutomic.syncthingandroid";
  versionCode = "4309";
}

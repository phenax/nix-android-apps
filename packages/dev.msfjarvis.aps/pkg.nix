args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = "dev.msfjarvis.aps";
  versionCode = "11350";
}

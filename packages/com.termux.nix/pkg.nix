args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = "com.termux.nix";
  versionCode = "66027";
}

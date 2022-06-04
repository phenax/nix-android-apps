args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = "com.duckduckgo.mobile.android";
  versionCode = "51251000";
}

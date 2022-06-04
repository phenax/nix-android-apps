args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = "org.sufficientlysecure.keychain";
  versionCode = "57500";
}

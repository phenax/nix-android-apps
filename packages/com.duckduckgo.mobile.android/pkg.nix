args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = "com.duckduckgo.mobile.android";
  versionCode = "51251000";
}

args:
let
  url = import ../../src/url.nix args;
in
url.makeUrlPackage {
  name = "io.github.phenax.owyn";
  version = "0.0.2";
  url = "https://github.com/phenax/owyn-launcher/releases/download/0.0.2/app-arm64-v8a-release.apk";
}

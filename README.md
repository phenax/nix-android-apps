# Nix android apps [WIP]
An experimental nix overlay to support installing/updating android apps declaratively.

Currently it installs apps using adb but I'm planning to switch to using [Nix-on-droid](https://github.com/t184256/nix-on-droid)

## Creating an installer
Example in [test.nix](./text.nix)

```nix
let
  android = import ./default.nix nixpkgs;
  installer = mkInstaller {
    packages = [
      android.pkgs."com.duckduckgo.mobile.android"
      android.pkgs."org.fdroid.fdroid"
      android.pkgs."io.github.phenax.owyn"
    ];
  };
in {
  buildInputs = [
    installer
  ];
}
```


## Add a new package

#### From F-Droid
```bash
./scripts/new-package.sh fdroid 'com.duckduckgo.mobile.android'
```

#### From apk url
```bash
./scripts/new-package.sh url \
  'io.github.phenax.owyn' \
  '0.0.2' \
  'https://github.com/phenax/owyn-launcher/releases/download/0.0.2/app-arm64-v8a-release.apk';
```


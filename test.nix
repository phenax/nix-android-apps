with builtins;
let
  nixpkgs = import <nixpkgs> { };
  android = import ./default.nix nixpkgs;
  testPackage = android.pkgs."com.termux.nix";
  packageNames = [
    "com.duckduckgo.mobile.android"
    "com.nutomic.syncthingandroid"
    "org.sufficientlysecure.keychain"
    "dev.msfjarvis.aps"
    "org.liberty.android.freeotpplus"
    "org.fdroid.fdroid"
    "io.github.phenax.owyn"
  ];
  packages = map (p: android.pkgs."${p}") packageNames;
  myPackage =
    with nixpkgs;
    stdenv.mkDerivation {
      pname = "test-package-here";
      version = "0.0.0";

      src = ''./test.nix'';
      unpackPhase = ''echo 1'';
      buildPhase = ''echo 1'';
      installPhase =
        let
          installScript = writeShellScript "install-android-apps" ''
            ${concatStringsSep " ;\n" (map (p: "echo Installing ${p.pname}@${p.version} && adb install ${p}/app.apk") packages)}
          '';
        in
        ''
          mkdir -p $out/apps;
          mkdir -p $out/bin;

          # Copy apps
          ${concatStringsSep " ; " (map (p: "cp ${p}/app.apk $out/apps/${p.pname}.apk") packages)}

          # Installer
          cp ${installScript} $out/bin/install-android-apps;
          wrapProgram $out/bin/install-android-apps --prefix PATH : ${lib.makeBinPath [bash android-tools]};
        '';

      buildInputs = [ packages ];
      nativeBuildInputs = [ makeWrapper ];
    };
in
nixpkgs.mkShell {
  buildInputs = [ myPackage ];
}

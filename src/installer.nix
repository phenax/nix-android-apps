nixpkgs: { name ? "android-package-installer", packages }:
with nixpkgs;
with builtins;
stdenv.mkDerivation {
  pname = name;
  version = "0.0.0";

  src = ''.'';
  unpackPhase = ''echo ""'';
  buildPhase = ''echo ""'';
  installPhase =
    let
      installPkg = p: ''
        echo "Installing ${p.pname}@${p.version}...";
        adb install ${p}/app.apk;
      '';
      installScript = writeShellScript "install-android-apps" ''
        ${concatStringsSep "\n" (map installPkg packages)}
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
}

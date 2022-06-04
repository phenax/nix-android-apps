{ stdenv, wget, ... }:
{
  makeFDroidPackage =
    { name, versionCode }: stdenv.mkDerivation rec {
      pname = name;
      version = versionCode;

      buildInputs = [ wget ];

      src = builtins.fetchurl "https://f-droid.org/repo/${name}_${versionCode}.apk";

      unpackPhase = ''mkdir -p $out && cp "$src" "$out/app.apk"'';
      buildPhase = ''ls'';

      installPhase = ''echo "$src"; echo "$out"; ls $src'';
    };
}

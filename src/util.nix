{ stdenv, wget, ... }:
{
  makeFDroidPackage =
    { pname, version, versionCode }: stdenv.mkDerivation rec {
      name = "${pname}--${versionCode}";
      inherit version;

      buildInputs = [ wget ];

      src = builtins.fetchurl "https://f-droid.org/repo/${pname}_${versionCode}.apk";

      unpackPhase = ''mkdir -p $out && cp "$src" "$out/app.apk"'';
      buildPhase = ''ls'';

      installPhase = ''echo "$src"; echo "$out"; ls $src'';
    };
}

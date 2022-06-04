{ stdenv, ... }:
{
  makeUrlPackage =
    { name, version, url }: stdenv.mkDerivation rec {
      pname = name;
      inherit version;

      src = builtins.fetchurl url;

      unpackPhase = ''mkdir -p $out && cp "$src" "$out/app.apk"'';
      buildPhase = ''ls'';

      installPhase = ''echo "$src"; echo "$out"; ls $src'';
    };
}

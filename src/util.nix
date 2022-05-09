{ stdenv, ... }:
{
  makeFDroidPackage =
    { pname, version, versionCode }: stdenv.mkDerivation rec {
      name = "${pname}--${versionCode}";
      inherit version;

      src = "https://f-droid.org/repo/${pname}_${versionCode}.apk";

      unpackPhase = ''wget -O ./app.apk "$src"'';

      installPhase = ''echo "installing app.apk"; ls $out;'';
    };
}

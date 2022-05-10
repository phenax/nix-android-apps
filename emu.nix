with import <nixpkgs>
{
  config = {
    android_sdk.accept_license = true;
    allowUnfree = true;
  };
};
mkShell rec {
  buildInputs = [
    genymotion
    # emulator
    # android.androidsdk

    # lib
    libclang
    pkg-config
    zlib
  ];
  nativeBuildInputs = [ clang ];
}

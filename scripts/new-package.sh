#!/usr/bin/env bash

cached() {
  local key=$1; shift 1;
  if [[ -f "./cache/$key" ]]; then
    cat "./cache/$key";
  else
    mkdir -p "./cache";
    "$@" | tee "./cache/$key";
  fi;
}

get_package_info() { cached "$1" curl "https://f-droid.org/api/v1/packages/$1" 2> /dev/null; }

get_version_code() {
  local package_info=$(get_package_info "$1");

  if [[ -z "$2" ]]; then
    echo "$package_info" | jq -r .suggestedVersionCode;
  else
    echo $package_info | jq -r ".packages | map(select(.versionName==\"$2\") | .versionCode) | .[]"
  fi;
}

fdroid_pkg_template() {
  local name="$1";
  local version="$2";
  local version_code=$(get_version_code "$name" "$version");
  version="${version:-$version_code}";

  echo "args:
let
  fdroid = import ../../src/fdroid.nix args;
in
fdroid.makeFDroidPackage {
  name = \"$name\";
  versionCode = \"$version_code\";
}";
}

url_pkg_template() {
  local name="$1";
  local version="$2";
  local url="$3";

  echo "args:
let
  url = import ../../src/url.nix args;
in
url.makeUrlPackage {
  name = \"$name\";
  version = \"$version\";
  url = \"$url\";
}";
}

generate_package() {
  local source="$1"; shift;

  local name="$1"; shift;

  mkdir -p ./packages/$name/;
  case "$source" in
    fdroid) fdroid_pkg_template "$name" "$@" > ./packages/$name/pkg.nix ;;
    url) url_pkg_template "$name" "$@" > ./packages/$name/pkg.nix ;;
  esac
}

generate_package "$@";

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

pkg_template() {
  local name="$1";
  local version="$2";
  local version_code=$(get_version_code "$name" "$version");
  version="${version:-$version_code}";

  echo "args:
let
  util = import ../../src/util.nix args;
in
util.makeFDroidPackage {
  name = \"$name\";
  versionCode = \"$version_code\";
}";
}

generate_package() {
  local name="$1";
  local version="$2";
  mkdir -p ./packages/$name/;
  pkg_template "$name" "$version" > ./packages/$name/pkg.nix;
}

generate_package "$@";

{ pkgs, lib, ... }@args:
let
  fileList = lib.filter (n: !(lib.hasSuffix "default.nix" n)) (lib.attrNames (builtins.readDir ./.));
  pkgList = map (f: pkgs.callPackage (./. + "/${f}/pkg.nix") args) fileList;
in
lib.foldl
  (c: p: lib.recursiveUpdate c { ${p.pname} = p; })
  ({ })
  pkgList

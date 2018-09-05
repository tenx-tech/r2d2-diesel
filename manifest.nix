let
  tenxDevPath = with import <nixpkgs> {}; fetchgitPrivate {
    inherit (builtins.fromJSON (builtins.readFile ./tenx-dev.src.json)) rev sha256 url;
  };
  tenxDev = import tenxDevPath {};
in
  with tenxDev; ((callPackage ./. {}) {}).src

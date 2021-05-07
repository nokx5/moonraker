{ }:

let
  pkgs = import <nixpkgs> {
    overlays = [
      (import "${builtins.fetchurl
        "https://raw.githubusercontent.com/mozilla/nixpkgs-mozilla/8c007b60731c07dd7a052cce508de3bb1ae849b4/rust-overlay.nix"}")
    ];
  };

  rust = pkgs.rustChannels.nightly.rust;
  cargo = pkgs.rustChannels.nightly.cargo;
  openssl = pkgs.openssl;
  cacert = pkgs.cacert;
in pkgs.mkShell { buildInputs = [ rust cargo cacert openssl ]; }

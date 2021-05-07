{ pkgs ? import <nokxpkgs> { } }:

let
  dev = pkgs.moonraker.overrideAttrs (oldAttrs: rec {
    name = "local_dev";
    src = ./.; # pkgs.nix-gitignore.gitignoreSource [ ".git" ] ./.;
  });
in pkgs // { inherit dev; }

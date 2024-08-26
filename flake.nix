{
  description = "A flake for the SkiCon Hugo website";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/05bbf675397d5366259409139039af8077d695ce.tar.gz"; # Pin the version of Hugo used in GH Workflows 
        sha256 = "1r26vjqmzgphfnby5lkfihz6i3y70hq84bpkwd43qjjvgxkcyki0";
      }) {
        inherit system;
      };
    hugoScript = pkgs.writeShellScriptBin "hugo-server" ''
        #!/usr/bin/env bash
        nix develop --command hugo server --watch --bind=0.0.0.0 --baseURL=http://localhost:1313
      '';
    in {
      packages.default = pkgs.hugo;

      devShell = pkgs.mkShell {
        buildInputs = [
          pkgs.hugo
        ];
      };

      defaultPackage = hugoScript;

      apps.default = {
        type = "app";
        program = "${hugoScript}/bin/hugo-server";
      };
    });
}
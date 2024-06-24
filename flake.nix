{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
        };

        flutter = pkgs.flutterPackages.v3_22;
      in {
        devShell = with pkgs;
          mkShell {
            CHROME_EXECUTABLE =
              "${pkgs.google-chrome}/bin/google-chrome-stable";
            FLUTTER_ROOT = flutter;

            buildInputs = [ firebase-tools flutter google-chrome ];
          };
      });
}

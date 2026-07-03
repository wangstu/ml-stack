{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        defaultPackage = pkgs.buildEnv {
        name = "ml-stack-init";
        paths = with pkgs; [
          openssh
          python3Packages.supervisor
          inotify-tools
          docker
          unzip
          coreutils
        ];
        };
      }
    );
}

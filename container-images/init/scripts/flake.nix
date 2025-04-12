{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
  };

  outputs = { self, nixpkgs }:
    let
      sys = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${sys};
    in
    {
      defaultPackage.${sys} = pkgs.buildEnv {
        name = "ml-stack-init";
        paths = with pkgs; [
          openssh
          python39Packages.supervisor
          inotify-tools
          docker
          unzip
          coreutils
        ];
      };
    };
}

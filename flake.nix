{
  description = "ML Stack Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # 基础工具
            grep
            coreutils
            findutils
            gawk
            sed
            bash
            curl
            wget
            git
            vim
            nano
            
            # 开发工具
            gcc
            gnumake
            cmake
            pkg-config
            
            # 网络工具
            netcat
            nmap
            iputils
            
            # 系统工具
            procps
            htop
            tree
            jq
            yq-go
          ];

          shellHook = ''
            echo "ML Stack Development Environment"
            echo "Available commands: grep, git, vim, nano, curl, wget, and more..."
          '';
        };
      }
    );
} 
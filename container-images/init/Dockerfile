FROM nixpkgs/nix:nixos-22.05 AS builder

WORKDIR /workspace

RUN mkdir -p /etc/nix /workspace/data

COPY ./scripts/flake.nix ./
COPY ./scripts/nix.conf /etc/nix/
RUN nix build . && cp -R $(nix-store -qR result) /workspace/data

FROM ubuntu:22.04

COPY --from=builder /workspace/data /nix/store/
COPY --from=builder /workspace/result /ml-stack-init/usr/
COPY ./scripts/sshd_config /ml-stack-init/ssh/sshd_config
COPY ./scripts/setup.sh /ml-stack-init/

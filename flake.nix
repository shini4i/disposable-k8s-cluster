{
  description = "Local environment for disposable-k8s-cluster";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      systems = lib.systems.flakeExposed;
    in {
      devShells = lib.genAttrs systems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          default = pkgs.mkShell {
            packages = with pkgs; [
              go-task
              jsonnet
              kubectl
              kind
              tfswitch
              terraform-docs
              tflint
              trivy
              trufflehog
              pre-commit
              checkov
            ];

            shellHook = ''
              export KUBECONFIG="$PWD/kubeconfig"
            '';
          };
        });
    };
}

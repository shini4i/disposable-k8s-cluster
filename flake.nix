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
          pkgs = import nixpkgs {
            inherit system;
            # checkov requires python-ecdsa, which nixpkgs flags for CVE-2024-23342
            # with no planned fix upstream. The flaw leaks the nonce when *signing*;
            # checkov only verifies signatures of external checks, which the advisory
            # states is unaffected. https://github.com/tlsfuzzer/python-ecdsa/issues/330
            config.permittedInsecurePackages = [ "python3.14-ecdsa-0.19.2" ];
          };
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

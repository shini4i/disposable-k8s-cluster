fullnameOverride: argo-cd

configs:
  knownHosts:
    data:
      ssh_known_hosts: |
        github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
        gitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=
        gitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf
        gitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9

controller:
  enableStatefulSet: true

applicationSet:
  enabled: false

notifications:
  enabled: false

server:
  ingress:
    enabled: true
    annotations:
      cert-manager.io/cluster-issuer: "le-disposable-dns"
    hosts:
      - ${fqdn}
    tls:
      - secretName: argo-cd-tls
        hosts:
          - ${fqdn}
    https: false

  config:
    helm.valuesFileSchemes: https, secrets+age-import
    exec.enabled: "true"

  extraArgs: ["--insecure"]

  extensions:
    enabled: true

    contents:
     - name: argo-rollouts
       url: "https://github.com/argoproj-labs/rollout-extension/releases/download/v0.2.1/extension.tar"

repoServer:
  image:
    repository: ghcr.io/shini4i/argocd
    tag: v${argo_cd_version}
    imagePullPolicy: IfNotPresent
  env:
    - name: HELM_PLUGINS
      value: "/home/argocd/.local/share/helm/plugins/"

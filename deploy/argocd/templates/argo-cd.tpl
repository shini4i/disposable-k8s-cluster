fullnameOverride: argo-cd

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
%{ if local_setup == true }
      external-dns.alpha.kubernetes.io/target: 127.0.0.1
%{ endif ~}
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

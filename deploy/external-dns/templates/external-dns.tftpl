apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: external-dns
  namespace: argo-cd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://charts.bitnami.com/bitnami
    chart: external-dns
    targetRevision: "${targetRevision}"
    helm:
      values: |
        fullnameOverride: external-dns

        sources:
        - ingress

        domainFilters:
        - ${fqdn}

        registry: "txt"
        txtOwnerId: "disposable"

        provider: "cloudflare"

        policy: sync

        cloudflare:
          proxied: false
          secretName: cloudflare-token

        logLevel: "debug"

  destination:
    server: https://kubernetes.default.svc
    namespace: kube-system

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: cert-manager-issuers
  namespace: argo-cd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://charts.adfinis.com
    chart: cert-manager-issuers
    targetRevision: "${targetRevision}"
    helm:
      values: |
        clusterIssuers:
          - name: le-disposable-dns
            spec:
              acme:
                email: disposable@${domain}
                %{ if use_staging_server }
                server: https://acme-staging-v02.api.letsencrypt.org/directory
                %{ else }
                server: https://acme-v02.api.letsencrypt.org/directory
                %{ endif }
                privateKeySecretRef:
                  name: disposable-issuer-account-key
                solvers:
                  - dns01:
                      cloudflare:
                        apiTokenSecretRef:
                          name: cloudflare-api-token-secret
                          key: api-token

  destination:
    server: https://kubernetes.default.svc
    namespace: cert-manager

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

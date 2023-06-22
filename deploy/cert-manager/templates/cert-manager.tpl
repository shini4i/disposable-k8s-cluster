apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: cert-manager
  namespace: argo-cd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://charts.jetstack.io
    chart: cert-manager
    targetRevision: "${targetRevision}"
    helm:
      values: |
        fullnameOverride: cert-manager
        installCRDs: true
        extraArgs:
          - --dns01-recursive-nameservers=8.8.8.8:53
          - --dns01-recursive-nameservers-only

  destination:
    server: https://kubernetes.default.svc
    namespace: kube-system

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

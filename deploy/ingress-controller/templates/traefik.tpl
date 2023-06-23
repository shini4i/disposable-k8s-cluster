apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: traefik
  namespace: argo-cd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://traefik.github.io/charts
    chart: traefik
    targetRevision: "${targetRevision}"
    helm:
      values: |
        providers:
          kubernetesCRD:
            allowCrossNamespace: true

          kubernetesIngress:
            publishedService:
              enabled: true

        %{ if local_setup == true }
        ports:
          web:
            redirectTo: websecure
            nodePort: 30080
          websecure:
            nodePort: 30443

        service:
          type: NodePort
        %{ endif ~}

  destination:
    server: https://kubernetes.default.svc
    namespace: web

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

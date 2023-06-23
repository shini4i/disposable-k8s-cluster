apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
 name: le-disposable-dns
 namespace: cert-manager
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

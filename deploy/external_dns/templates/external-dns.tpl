sources:
  - ingress

domainFilters:
%{ if length(split(".", fqdn)) >= 3 ~}
  - ${element(split(".", fqdn), 1)}.${element(split(".", fqdn), 2)}
%{ endif ~}
  - ${fqdn}

registry: "txt"
txtOwnerId: "disposable"

provider: "cloudflare"

policy: sync

cloudflare:
  proxied: false
  secretName: cloudflare-token

logLevel: "debug"

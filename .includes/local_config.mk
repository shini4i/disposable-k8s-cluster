CLOUD_PROVIDER ?= kind
DOMAIN = $(DISPOSABLE_DOMAIN)
USE_LETSENCRYPT_STAGE ?= false

# If set to true, will skip the creation of traefik, cert-manager and external-dns
SKIP_EXPOSE ?= false

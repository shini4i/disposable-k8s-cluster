{
  cloud_provider: 'kind', // Where to bootstrap the cluster (kind, digitalocean)
  domain: "example.com", // Domain to use for the cluster
  cloudflare_api_token: "your-cloudflare-api-token", // Cloudflare API token with write permissions on selected domain
  do_token: "your-do-token", // DigitalOcean API token (used only if cloud_provider is digitalocean)
  skip_expose: false, // If cert-manager and external-dns should be disabled
  application_set_enabled: false, // If true, enable the application set controller
  argocd_applicationset_addons: { // Which of the common ApplicationSet should be enabled
    enable_sealed_secrets: false, // a controller for encrypting secrets to safely store them in a Git repository
    enable_reflector: false, // a controller for syncing resources between namespaces
    enable_argo_workflows: false, // a controller for running Argo Workflows
    enable_argo_rollouts: false, // a controller for managing progressive delivery with Argo Rollouts
  },
  argo_cd_chart_version: '8.2.4',
  use_custom_argocd_image: true, // If true, will use the custom image for repo-server
  custom_argocd_image: 'ghcr.io/shini4i/argocd',
  custom_argocd_image_tag: 'v3.0.12',
  argo_watcher_chart_version: '0.8.0',
  argo_watcher_enabled: false,
  argo_watcher_persistence_enabled: false, // If true, will deploy postgresql and use it for persistence
  argo_watcher_image_tag_override: '',
  cert_manager_chart_version: '1.17.1',
  cert_manager_wildcard_enabled: false, // If true, will generate a wildcard certificate for the domain
  le_use_stage_issuer: false, // If true, use the staging issuer
  external_dns_chart_version: '1.18.0',
  gitlab_runner_chart_version: '0.71.0',
  gitlab_runner_enabled: false, // If gitlab-runner should be deployed
  gitlab_url: "https://gitlab.com", // URL of the GitLab instance
  gitlab_runner_token: "your-gitlab-runner-token", // runner-token (NOT runner-registration-token)
  gitops_common_basepath: 'common', // Path to the common ApplicationSet templates
  gitops_common_path: 'addons', // Path to the common ApplicationSet templates
  gitops_common_repo: 'https://github.com/shini4i/gitops-playground.git', // Repository with common ApplicationSet templates
  gitops_common_revision: 'main', // Branch or tag to use from the common repository
  ingress_controller: 'traefik', // Which ingress controller to use (ingress-nginx or traefik)
  ingress_controller_chart_versions: { // Helm chart versions for the ingress controllers
    traefik: '34.4.1',
    "ingress-nginx": '4.12.1',
  },
  netpol_enabled: false, // If true, will deploy network policies for all supported services
}

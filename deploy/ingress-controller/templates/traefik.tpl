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

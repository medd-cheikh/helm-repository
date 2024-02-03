# Chaos Chart : Main [![Artifacthub](https://img.shields.io/badge/ArtifactHub-STARTX_chaos-2B83E2.svg)](https://artifacthub.io/packages/search?ts_query_web=chaos+startx)

This helm chart is used to deploy a chaos test suite composed of cerberus, kraken, litmus, chaos mesh and kube-monkey.

This chart is part of the [chaos startx helm chart series](https://helm-repository.readthedocs.io#chaos-helm-charts) focused on deploying various kind of chaos tools for cluster infrastructure or applications chaos-testing. [chaos-xxx charts](https://helm-repository.readthedocs.io#chaos-helm-charts).

## Requirements and guidelines

Read the [startx helm-repository homepage](https://helm-repository.readthedocs.io) for
more information on how to use theses resources.

## Deploy this helm chart on openshift

### 1. Connect to your Openshift cluster

```bash
oc login -t <token> <cluster-url>
```

### 2. Install the repository

```bash
helm repo add startx https://helm-repository.readthedocs.io/en/latest/repos/stable/
```

### 3. Get information about this chart

```bash
helm show chart startx/chaos
```

### 4. Install this suite

```bash
# Install the projects
helm install \
--set cerberus.enabled=true --set cerberus.project.enabled=true  \
--set kraken.enabled=true --set kraken.project.enabled=true  \
--set litmus.enabled=true --set litmus.project.enabled=true  \
--set mesh.enabled=true --set mesh.project.enabled=true  \
--set monkey.enabled=true --set monkey.project.enabled=true  \
chaos-projects  startx/chaos
# Deploy the cerberus instance
helm install \
--set cerberus.enabled=true --set cerberus.cerberus.enabled=true  \
chaos-cerberus-instance  startx/chaos-cerberus
# Deploy the kraken instance in a job mode
helm install \
--set kraken.enabled=true --set kraken.kraken.enabled=true  \
--set kraken.kraken.mode=job  \
chaos-kraken-instance-job  startx/chaos-kraken
# Deploy the kraken instance with tekton pipeline (require pipeline been installed)
helm install \
--set kraken.enabled=true --set kraken.kraken.enabled=true  \
--set kraken.kraken.mode=pipeline \
chaos-kraken-instance-pipeline  startx/chaos-kraken
# Deploy the litmus instance
helm install \
--set litmus.enabled=true --set litmus.litmus.enabled=true  \
chaos-litmus-instance  startx/chaos-litmus
# Deploy the mesh instance
helm install \
--set mesh.enabled=true --set mesh.mesh.enabled=true  \
chaos-mesh-instance  startx/chaos-mesh
# Deploy the monkey instance
helm install \
--set monkey.enabled=true --set monkey.monkey.enabled=true  \
chaos-monkey-instance  startx/chaos-monkey
```

### 5. Manage with ArgoCD

ArgoCD will allow you to deploy this helm chart in a gitops way of doying. [ArgoCD deployment](../../docs/install-argocd.md) must help you deploy the ArgoCD stack.

 In order to manage this cluster resource using argoCD, you should deploy your service [using startx charts(#0.requirements)] :
- [project](../../docs/install-argocd.md#11-create-cluster-service-projects) to created required projects
- [operator](../../docs/install-argocd.md#12-deploy-the-operator) to deploy required operators
- [instance](../../docs/install-argocd.md#13-create-a-cluster-service-instance) to deploy this resource components 

#### 5.1 Create project

```yaml
kind: Application
apiVersion: argoproj.io/v1alpha1
metadata:
name: chaos
namespace: "chaos"
spec:
destination:
  namespace: "default"
  server: 'https://kubernetes.default.svc'
project: default
source:
  repoURL: 'https://helm-repository.readthedocs.io/en/latest/repos/stable'
  targetRevision: "14.6.103"
  chart: chaos
  helm:
    values: |
      ingress:
        enabled: true
        path: /
        hosts:
          - mydomain.example.com
        annotations:
          kubernetes.io/ingress.class: nginx
          kubernetes.io/tls-acme: "true"
        labels: {}
    parameters:
      - name: sxapi.service.enabled
      value: "true"
      - name: sxapi.service.expose
      value: "true"
destination:
  server: 'https://kubernetes.default.svc'
  namespace: demo-chaos
syncPolicy:
  automated:
    prune: true
  syncOptions:
    - CreateNamespace=true
  retry:
    limit: 3
```

#### 5.2 Enable operator

#### 5.3 Deploy cluster-service instance



## Values dictionary

### context values dictionary

| Key                 | Default   | Description                                                                                                                                                                                                                                                                                               |
| ------------------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| context.scope       | default   | Name of the global scope for this application (organisational tenant)                                                                                                                                                                                                                                     |
| context.cluster     | localhost | Name of the cluster running this application (plateform tenant)                                                                                                                                                                                                                                           |
| context.environment | dev       | Name of the environement for this application (ex: dev, factory, preprod or prod)                                                                                                                                                                                                                         |
| context.component   | demo      | Component name of this application (logical tenant)                                                                                                                                                                                                                                                       |
| context.app         | sxapi     | Application name (functionnal tenant, default use Chart name)                                                                                                                                                                                                                                             |
| context.version     | 0.0.1     | Version name of this application (default use Chart appVersion)                                                                                                                                                                                                                                           |
| cerberus            | {...}     | Configuration of the cerberus component. Inherit from the [chaos-cerberus chart](https://helm-repository.readthedocs.io/en/latest/charts/chaos-cerberus) (see [chart options](https://helm-repository.readthedocs.io/en/latest/charts/chaos-cerberus/#chaos-cerberus-values-dictionary) for more options) |
| kraken              | {...}     | Configuration of the kraken component. Inherit from the [chaos-kraken chart](https://helm-repository.readthedocs.io/en/latest/charts/chaos-kraken) (see [chart options](https://helm-repository.readthedocs.io/en/latest/charts/chaos-kraken/#chaos-kraken-values-dictionary) for more options)           |
| litmus              | {...}     | Configuration of the litmus component. Inherit from the [chaos-litmus chart](https://helm-repository.readthedocs.io/en/latest/charts/chaos-litmus) (see [chart options](https://helm-repository.readthedocs.io/en/latest/charts/chaos-litmus/#chaos-litmus-values-dictionary) for more options)           |
| mesh                | {...}     | Configuration of the chaos-mesh component. Inherit from the [chaos-mesh chart](https://helm-repository.readthedocs.io/en/latest/charts/chaos-mesh) (see [chart options](https://helm-repository.readthedocs.io/en/latest/charts/chaos-mesh/#chaos-mesh-values-dictionary) for more options)               |
| monkey              | {...}     | Configuration of the kube-monkey component. Inherit from the [chaos-monkey chart](https://helm-repository.readthedocs.io/en/latest/charts/chaos-monkey) (see [chart options](https://helm-repository.readthedocs.io/en/latest/charts/chaos-monkey/#chaos-monkey-values-dictionary) for more options)      |

## Values files

### Default values file (values.yaml)

#### Deploy chaos namespaces

Deploy the chaos test suite environment :

- 1 **project** named **chaos-cerberus**
- 1 **project** named **chaos-kraken**
- 1 **project** named **chaos-litmus**
- 1 **project** named **chaos-mesh**
- 1 **project** named **chaos-monkey**

```bash
helm install \
 --set cerberus.enable=true --set cerberus.project.enable=true \
 --set kraken.enable=true   --set kraken.project.enable=true \
 --set litmus.enable=true   --set litmus.project.enable=true \
 --set mesh.enable=true     --set mesh.project.enable=true \
 --set monkey.enable=true   --set monkey.project.enable=true \
 chaos startx/chaos
```

#### Deploy cerberus

Deploy the cerberus component

```bash
helm install \
--set cerberus.enable=true --set cerberus.cerberus.enable=true \
chaos-cerberus startx/chaos-cerberus
```

#### Deploy kraken

Deploy the kraken component

```bash
helm install \
--set kraken.enable=true --set kraken.kraken.enable=true \
chaos-kraken startx/chaos-kraken
```

#### Deploy litmus

Deploy the litmus component

```bash
helm install \
--set litmus.enable=true --set litmus.litmus.enable=true \
chaos-litmus startx/chaos-litmus
```

#### Deploy Chaos-mesh

Deploy the chaos-mesh component

```bash
helm install \
--set mesh.enable=true --set mesh.mesh.enable=true \
chaos-mesh startx/chaos-mesh
```

#### Deploy Kube-monkey

Deploy the kube-monkey component

```bash
helm install \
--set monkey.enable=true --set monkey.monkey.enable=true \
chaos-monkey startx/chaos-monkey
```

## History

| Release  | Date       | Description                                                                                                                        |
| -------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 10.12.5  | 2022-06-03 | Initial commit of the example and poc chart example-chaos                                                                          |
| 10.12.8  | 2022-06-11 | Initial commit for this helm chart as part of the chaos suite                                                                      |
| 10.12.26 | 2022-06-17 | Create the chaos-mesh chart as part of the startx chaos chart suite                                                                |
| 10.12.28 | 2022-06-17 | Upgrade the chaos-cerberus helm chart schema with full option support. Link to upstream project release latest (no stable release) |
| 10.12.29 | 2022-06-17 | Align all charts to version 10.12.29                                                                                               |
| 10.12.29 | 2022-06-17 | publish stable update for the full repository                                                                                      |
| 10.12.30 | 2022-06-17 | Improved logo and global documentation                                                                                             |
| 10.12.33 | 2022-06-17 | version all dependencies charts                                                                                                    |
| 10.12.33 | 2022-06-17 | publish stable update for the full repository                                                                                      |
| 10.12.34 | 2022-06-17 | Align all dependencies charts to 10.12.31                                                                                          |
| 10.12.35 | 2022-06-18 | Improve icon                                                                                                                       |
| 10.12.39 | 2022-06-18 | Align all chart to revision 10.12.39                                                                                               |
| 10.12.41 | 2022-06-18 | Align all charts to version 10.12.41                                                                                               |
| 10.12.42 | 2022-06-18 | Improve schema default values, notes and polish helm deployment documentation                                                      |
| 10.12.43 | 2022-06-18 | Improve doc for helm deployment                                                                                                    |
| 10.12.46 | 2022-06-18 | publish stable update for the full repository                                                                                      |
| 10.12.47 | 2022-06-18 | Minor improvment in doc and sample values                                                                                          |
| 10.12.49 | 2022-06-18 | publish stable update for the full repository                                                                                      |
| 10.12.51 | 2022-06-18 | Update chaos chart dependencies to version 10.12.47                                                                                |
| 10.12.52 | 2022-06-18 | Update chaos chart dependencies to version 10.12.46                                                                                |
| 10.12.52 | 2022-06-18 | Update chaos chart dependencies to version 10.12.47                                                                                |
| 10.12.53 | 2022-06-18 | Update chaos chart dependencies to version 10.12.46                                                                                |
| 10.12.53 | 2022-06-18 | Update chaos chart dependencies to version 10.12.43                                                                                |
| 10.12.61 | 2022-06-18 | All chart are aligned to release 10.12.61                                                                                          |
| 10.12.53 | 2022-06-18 | publish stable update for the full repository                                                                                      |
| 10.12.71 | 2022-06-28 | Debug the appVersion in all charts                                                                                                 |
| 10.12.72 | 2022-07-02 | Common release                                                                                                                     |
| 10.12.77 | 2022-07-02 | Stable for clients                                                                                                                 |
| 10.12.81 | 2022-07-02 | publish stable update for the full repository                                                                                      |
| 10.12.97 | 2022-07-03 | publish stable update for the full repository                                                                                      |
| 10.12.99 | 2022-09-16 | Initialize OCP 4.11 upgrade on all chart                                                                                           |
| 11.5.3   | 2022-09-17 | Align all STARTX charts to release 11.5.3                                                                                          |
| 11.7.1   | 2022-10-01 | Upgrade chart to latest release available for OCP 4.11.7 release                                                                   |
| 11.7.3   | 2022-10-02 | publish stable update for the full repository                                                                                      |
| 11.7.9   | 2022-10-02 | publish stable update for the full repository                                                                                      |
| 11.7.10 | 2022-10-02 | Stable release for all packages
| 11.7.11 | 2022-10-02 | publish stable update for the full repository
| 11.7.15 | 2022-10-02 | publish stable update for the full repository
| 11.7.17 | 2022-10-02 | publish stable update for the full repository
| 11.7.31 | 2022-10-29 | publish stable update for the full repository
| 11.7.33 | 2022-10-29 | Update all startx packages to release 11.7.33
| 11.7.41 | 2022-11-02 | publish stable update for the full repository
| 11.7.61 | 2022-11-30 | publish stable update for the full repository
| 11.7.62 | 2022-11-30 | Debug console links and notifications
| 11.7.63 | 2022-11-30 | publish stable update for the full repository
| 11.7.64 | 2022-11-30 | Increment sxapi version
| 11.7.67 | 2022-11-30 | Debug depedencies on sub charts
| 11.7.67 | 2022-11-30 | Debug depedencies on sub charts
| 11.7.69 | 2022-11-30 | Finished dependencies stabilization
| 11.7.73 | 2022-12-04 | Align all packages to release 11.7.73
| 11.7.75 | 2022-12-04 | publish stable update for the full repository
| 11.7.77 | 2022-12-05 | publish stable update for the full repository
| 11.7.87 | 2023-02-15 | publish stable update for the full repository
| 11.7.88 | 2023-02-15 | publish stable update for the full repository
| 11.7.91 | 2023-02-16 | publish stable update for the full repository
| 11.7.93 | 2023-02-16 | align dependencies to version 11.7.89
| 11.7.97 | 2023-02-19 | publish stable update for the full repository
| 11.28.11 | 2023-02-19 | publish stable update for the full repository
| 11.28.15 | 2023-02-19 | publish stable update for the full repository
| 11.28.16 | 2023-02-19 | publish stable update for the full repository
| 11.28.19 | 2023-02-19 | publish stable update for the full repository
| 11.28.21 | 2023-02-19 | Upgrade all dependencies packages to release 11.28.15
| 11.28.23 | 2023-02-21 | publish stable update for the full repository
| 11.28.27 | 2023-02-21 | All chart aligned to release 11.28.27
| 11.28.28 | 2023-02-21 | Improve chaos options
| 11.28.28 | 2023-02-21 | Improve chaos options
| 11.28.28 | 2023-02-21 | Improve chaos options
| 11.28.28 | 2023-02-21 | Improve chaos options
| 11.28.29 | 2023-02-21 | publish stable update for the full repository
| 11.28.31 | 2023-02-21 | Rebuild dependencies
| 11.28.33 | 2023-02-21 | Improve chaos options
| 11.28.35 | 2023-02-21 | publish stable update for the full repository
| 11.28.39 | 2023-02-21 | Improve chaos options
| 11.28.43 | 2023-02-21 | Improve chaos options
| 11.28.43 | 2023-02-21 | Improve chaos options
| 11.28.49 | 2023-02-21 | publish stable update for the full repository
| 11.28.59 | 2023-02-21 | publish stable update for the full repository
| 11.28.60 | 2023-02-21 | publish stable update for the full repository
| 11.28.67 | 2023-02-23 | publish stable update for the full repository
| 11.28.69 | 2023-03-07 | publish stable update for the full repository
| 11.28.89 | 2023-04-01 | publish stable update for the full repository
| 11.28.93 | 2023-04-20 | publish stable update for the full repository
| 11.28.95 | 2023-04-21 | publish stable update for the full repository
| 11.28.99 | 2023-04-21 | publish stable update for the full repository
| 11.28.103 | 2023-05-04 | publish stable update for the full repository
| 11.28.127 | 2023-06-12 | publish stable update for the full repository
| 11.28.128 | 2023-06-12 | publish stable update for the full repository
| 11.28.129 | 2023-06-13 | publish stable update for the full repository
| 11.28.199 | 2023-07-06 | publish stable update for the full repository
| 11.28.201 | 2023-07-06 | publish stable update for the full repository
| 11.28.203 | 2023-07-06 | Upgrade dependencies
| 11.28.203 | 2023-07-06 | Improve chaos options
| 11.28.205 | 2023-07-06 | Improve chaos options
| 11.28.206 | 2023-07-06 | Improve chaos options
| 11.28.207 | 2023-07-06 | publish stable update for the full repository
| 11.28.230 | 2023-08-18 | Align all helm chart to release 11.28.230 stable release
| 11.30.0 | 2023-08-18 | Align all helm chart to release 11.30.0 stable for OCP 4.11.30
| 11.40.0 | 2023-08-18 | Align all helm chart to release 11.40.0 stable for OCP 4.11.40
| 11.47.0 | 2023-08-18 | Align all helm chart to release 11.47.0 stable for OCP 4.11.47
| 11.47.1 | 2023-08-18 | Update appVersion in Chart.yml
| 11.47.1 | 2023-08-18 | Update appVersion in Chart.yml
| 12.0.0 | 2023-08-18 | Align all helm chart to release 12.0.0 transitionnal for OCP 4.12.0 target (unstable)
| 12.0.1 | 2023-08-18 | Align all helm chart to release 12.0.1 transitionnal for OCP 4.12.0 target (unstable)
| 12.0.3 | 2023-08-18 | Update all chart dependencies to 12.0.0 release (unstable)
| 12.0.5 | 2023-08-18 | publish stable update for the full repository
| 12.0.11 | 2023-08-18 | publish stable update for the full repository
| 12.30.1 | 2023-09-29 | release 12.30.1 aligned and tested with OCP 4.12.30
| 12.36.1 | 2023-09-29 | release 12.36.0 aligned with OCP 4.12.36 (unstable)
| 12.36.9 | 2023-10-01 | publish stable update for the full repository
| 12.36.36 | 2023-10-11 | publish stable update for the full repository
| 12.36.49 | 2023-11-13 | publish stable update for the full repository
| 12.36.51 | 2023-11-13 | publish stable update for the full repository
| 12.36.53 | 2023-11-13 | Align all startx dependencies packages to version 12.36.49 stable for OCP 4.12.36
| 12.36.55 | 2023-11-13 | Align all startx dependencies packages to version 12.36.49 stable for OCP 4.12.36
| 12.36.58 | 2023-11-13 | Align all startx dependencies packages to version 12.36.49 stable for OCP 4.12.36
| 12.36.59 | 2023-11-13 | publish stable update for the full repository
| 12.36.63 | 2023-11-13 | publish stable update for the full repository
| 12.36.64 | 2023-11-13 | publish stable update for the full repository
| 12.36.65 | 2023-11-14 | publish stable update for the full repository
| 12.36.66 | 2023-11-14 | Update trunc to 255 for helper
| 12.36.67 | 2023-11-14 | move dependencies to version 12.36.65
| 12.36.69 | 2023-11-14 | move dependencies to version 12.36.65
| 12.45.0 | 2023-12-08 | Stable version aligned to Openshift version 4.12.45
| 13.26.0 | 2023-12-08 | Unstable version aligned to Openshift version 4.13.26 to prepare the 13.26.x stable release (short lived)
| 13.26.1 | 2023-12-09 | Minimum requirements for kubernetes is 1.26.0 version and upgrade all cluster-xxx charts to latest release for OCP 4.13
| 13.26.2 | 2023-12-09 | upgrade all dependencies charts to version 13.26.0
| 13.26.3 | 2023-12-09 | publish stable update for the full repository
| 14.6.0 | 2023-12-09 | First release for OCP 4.14 release. Aligned on 4.14.6 release.
| 14.6.1 | 2023-12-09 | iniFirst release for OCP 4.14 release. Aligned on 4.14.6 release
| 14.6.2 | 2023-12-09 | debug app version
| 14.6.3 | 2023-12-10 | Unstable version of the full repository
| 14.6.5 | 2023-12-10 | upgrade all dependencies charts to version 13.26.2
| 14.6.9 | 2023-12-10 | publish stable update for the full repository
| 14.6.11 | 2023-12-10 | upgrade minimum kubeVersion to 1.27.x and startx helm-chart dependencies to version 14.6.5
| 14.6.15 | 2023-12-11 | update packages for OCP 4.14.6
| 14.6.21 | 2023-12-18 | publish stable update for the full repository
| 14.6.22 | 2023-12-18 | stable si good
| 14.6.22 | 2023-12-18 | stable si good
| 14.6.23 | 2023-12-19 | publish stable update for the full repository
| 14.6.23 | 2023-12-19 | publish stable update for the full repository
| 14.6.27 | 2023-12-19 | publish stable update for the full repository
| 14.6.29 | 2023-12-19 | publish stable update for the full repository
| 14.6.31 | 2023-12-19 | move to kubeversion min 1.25.0
| 14.6.33 | 2023-12-19 | Move dependencies to github-pages
| 14.6.35 | 2023-12-20 | publish stable update for the full repository
| 14.6.45 | 2023-12-22 | publish stable update for the full repository
| 14.6.46 | 2023-12-22 | publish stable update for the full repository
| 14.6.55 | 2023-12-22 | align all dependencies chart to 14.6.45
| 14.6.59 | 2023-12-22 | publish stable update for the full repository
| 14.6.59 | 2023-12-22 | publish stable update for the full repository
| 14.6.59 | 2023-12-22 | move back dependencies to version 14.6.35
| 14.6.63 | 2023-12-22 | Align all startx helm-chart to version 14.6.63
| 14.6.65 | 2023-12-27 | test with repo stored in s3 public bucket
| 14.6.71 | 2023-12-28 | Move to S3 helm repository
| 14.6.71 | 2023-12-28 | Move to S3 helm repository
| 14.6.73 | 2023-12-29 | Upgrade all startx chart dependencies to version 14.6.65
| 14.6.75 | 2023-12-29 | Upgrade all startx chart dependencies to version 14.6.71
| 14.6.77 | 2024-01-02 | Improve chaos options
| 14.6.79 | 2024-01-02 | Improve chaos options
| 14.6.81 | 2024-01-02 | Improve chaos options
| 14.6.83 | 2024-01-02 | publish stable update for the full repository
| 14.6.85 | 2024-01-02 | publish stable update for the full repository
| 14.6.87 | 2024-01-02 | publish stable update for the full repository
| 14.6.91 | 2024-01-02 | publish stable update for the full repository
| 14.6.99 | 2024-01-02 | Full stable release of the chart repository
| 14.6.103 | 2024-01-03 | Upgrade all startx chart dependencies to version 14.6.75
| 14.6.105 | 2024-01-03 | publish stable update for the full repository
| 14.6.107 | 2024-01-04 | publish stable update for the full repository
| 14.6.107 | 2024-01-04 | publish stable update for the full repository
| 14.6.109 | 2024-01-04 | Update all chart dependencies to version 14.6.105
| 14.6.131 | 2024-01-18 | publish stable update for the full repository
| 14.6.133 | 2024-01-18 | Update the documentation with artifacthub badge
| 14.6.135 | 2024-01-18 | debug artifacthub recommandations
| 14.6.137 | 2024-01-18 | publish stable update for the full repository
| 14.6.141 | 2024-02-03 | upgrade of the full startx repository

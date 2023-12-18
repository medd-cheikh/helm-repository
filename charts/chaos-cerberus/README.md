# Chaos - Cerberus

This helm chart used to deploy cerberus on Openshift or Kubernetes cluster. 
Cerberus is as a watchdog who act as a global cluster healthcheck. 

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
helm repo add startx https://helm-repository.readthedocs.io/en/latest/packages/
```

### 3. Get information about this chart

```bash
helm show chart startx/chaos-cerberus
```

### 4. Install this component

```bash
# Install the cerberus project
helm install --set project.enabled=true chaos-cerberus-project  startx/chaos-cerberus
# Deploy the cerberus instance
helm install --set cerberus.enabled=true  chaos-cerberus-instance startx/chaos-cerberus
```

## Values dictionary

### context values dictionary

| Key                 | Default   | Description                                                                       |
| ------------------- | --------- | --------------------------------------------------------------------------------- |
| context.scope       | default   | Name of the global scope for this application (organisational tenant)             |
| context.cluster     | localhost | Name of the cluster running this application (plateform tenant)                   |
| context.environment | dev       | Name of the environement for this application (ex: dev, factory, preprod or prod) |
| context.component   | demo      | Component name of this application (logical tenant)                               |
| context.app         | sxapi     | Application name (functionnal tenant, default use Chart name)                     |
| context.version     | 0.0.1     | Version name of this application (default use Chart appVersion)                   |

### chaos-cerberus values dictionary

| Key                              | Default                | Description                                                                                                                                                                                                                                                                       |
| -------------------------------- | ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| project                          | {...}                  | Configuration of the project (or namespace). Inherit from the [project chart](https://helm-repository.readthedocs.io/en/latest/charts/project) (see [chart options](https://helm-repository.readthedocs.io/en/latest/charts/project/#project-values-dictionary) for more options) |
| project.enable                   | false                  | Enable creation of the namespace                                                                                                                                                                                                                                                  |
| cerberus                         | {...}                  | Configuration of the cerberus deployment                                                                                                                                                                                                                                          |
| cerberus.enable                  | false                  | Enable deploying the cerberus watchdog                                                                                                                                                                                                                                            |
| cerberus.expose                  | true                   | Enable exposition for this application (route based)                                                                                                                                                                                                                              |
| cerberus.kraken_allowed          | true                   | Enable kraken pod to query the cerberus healthcheck (networkpolicy)                                                                                                                                                                                                               |
| cerberus.kraken_ns               | chaos-kraken           | Namespace of the kraken pod that would be allowed                                                                                                                                                                                                                                 |
| cerberus.watch_url_routes        | []                     | Url list of endpoint to watch as part of the global healthcheck (double array)                                                                                                                                                                                                    |
| cerberus.kubeconfig              | {...}                  | Kubeconfig of the supervised tested cluster (mandatory)                                                                                                                                                                                                                           |
| cerberus.kubeconfig.mode         | token                  | Connection mode to use for the cluster (could be token or file)                                                                                                                                                                                                                   |
| cerberus.kubeconfig.token        | {...}                  | If mode is token, this section must be filled                                                                                                                                                                                                                                     |
| cerberus.kubeconfig.token.server | https://localhost:6443 | The server URL to the target cluster API                                                                                                                                                                                                                                          |
| cerberus.kubeconfig.token.token  | sha256~XXX             | The token to use to get access. This token must have full cluster admin access to perform some chaos scenarios                                                                                                                                                                    |
| cerberus.kubeconfig.file         | ""                     | If mode is token, this property must be set with a full kubeconfig content                                                                                                                                                                                                        |

## Values files

### Default values file (values.yaml)

Simple cerberus with default configuration :

- 1 **project** named **chaos-cerberus**
- 1 **scc** with privileged context for **cerberus** deployment
- 1 **configmap** with cerberus server configuration
- 1 **configmap** with kubeconfig of the targeted cluster
- 2 **networkpolicy** allowing route and kraken pods in chaos-kraken namespace, to get cerberus signal
- 1 **deployment** named **cerberus** 
  - watching the cluster https://localhost:6443
  - using token sha256~XXXXXXXXXX_PUT_YOUR_TOKEN_HERE_XXXXXXXXXXXX
  - watching no particular routes (as part of the watchdog)
- 1 **service** to the **cerberus** pods
- 1 **route** to the **cerberus** service

```bash
# Install the cerberus project
helm install --set project.enable=true chaos-cerberus-project startx/chaos-cerberus
# Deploy the cerberus instance
helm install --set cerberus.enable=true -n chaos-cerberus chaos-cerberus-instance startx/chaos-cerberus
```

### STARTX values file (values-startx-xxx.yaml)

Same as the default configuration but with namespace prefixed with startx-

```bash
# Configuration running demo example configuration
helm install chaos-cerberus-project startx/chaos-cerberus -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/chaos-cerberus/values-startx-project.yaml
helm install chaos-cerberus-deploy startx/chaos-cerberus -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/chaos-cerberus/values-startx-deploy.yaml
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
| 11.28.25 | 2023-02-21 | Debug route NS scope placement
| 11.28.27 | 2023-02-21 | All chart aligned to release 11.28.27
| 11.28.28 | 2023-02-21 | Improve chaos-cerberus options
| 11.28.29 | 2023-02-21 | publish stable update for the full repository
| 11.28.35 | 2023-02-21 | publish stable update for the full repository
| 11.28.39 | 2023-02-21 | Improve chaos-cerberus options
| 11.28.39 | 2023-02-21 | Improve chaos-cerberus options
| 11.28.40 | 2023-02-21 | Improve chaos-cerberus options
| 11.28.41 | 2023-02-21 | Improve chaos-cerberus options
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
| 14.6.5 | 2023-12-10 | upgrade all dependencies charts to version 13.26.2
| 14.6.9 | 2023-12-10 | publish stable update for the full repository
| 14.6.11 | 2023-12-10 | upgrade minimum kubeVersion to 1.27.x and startx helm-chart dependencies to version 14.6.5
| 14.6.15 | 2023-12-11 | update packages for OCP 4.14.6
| 14.6.21 | 2023-12-18 | publish stable update for the full repository

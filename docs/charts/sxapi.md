# SXAPI Helm-chart

This helm chart is used to deploy a lightweight micro-service based on
the [sxapi engine](https://sxapi-core.readthedocs.io). The deployment is exposed into the cluster
and could be exposed outside by using various exposition method (ingress, route or nodePort).

You can configure the behavior of you micro-service directly into your values.yaml file and versionning
it will allow you to keep track of your application states.

## Requirements and guidelines

Read the [startx helm-repository homepage](https://helm-repository.readthedocs.io) for
more information on how to use STARTX helm chart.

## Deploy this helm chart on openshift

### 1. Connect to your Openshift cluster

```bash
oc login -t <token> <cluster-url>
```

### 2. Install the repository

```bash
helm repo add startx https://startxfr.github.io/helm-repository/packages/
```

### 3. Get information about this chart

```bash
helm show chart startx/sxapi
```

### 4. Install this chart

```bash
helm install startx/sxapi
```

## Deploy this helm chart on kubernetes

### 1. Connect to your kubernetes cluster

```bash
kubectl login -t <token> <cluster-url>
```

### 2. Install the STARTX helm repository

```bash
helm repo add startx https://startxfr.github.io/helm-repository/packages/
```

### 3. Information about this chart

```bash
helm show chart startx/sxapi
```

### 4. Install sxapi chart

```bash
helm install startx/sxapi
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

### sxapi values dictionary

| Key                   | Default    | Description                                           |
| --------------------- | ---------- | ----------------------------------------------------- |
| sxapi.service.enabled | false      | Enable service for this application                   |
| sxapi.version         | 0.3.58     | Sxapi image version to run                            |
| sxapi.profile         | prod:start | Profile to run inside the container                   |
| sxapi.debug           | true       | Enable debuging of the container                      |
| sxapi.replicas        | 1          | Define the number of replicas for this sxapi instance |
| sxapi.data            | string     | Files to load into the application                    |

## Values files

### Default values file

The [values.yaml example file](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values.yaml) define a deployment with the following characteristics :

- 1 **service** named **sxapi** load balancing to pod deployed
- 1 **deployment** named **sxapi** deploying **1 pod** from version **0.3.58** sxapi image running the **prod:start** command with :
  - debug disabled
  - **/** : homepage with html content
  - **/health** : health page
  - **/info** : description of the micro-service
  - **/ping** : return a pong message
- 2 **configMap** for application instance configuration
  - **lib** : Versionned content of the sxapi configuration file and related content
  - **app** : Environment variable describing the application deployed in version *0.0.1*

```bash
# base configuration running default configuration
helm install startx/sxapi
```

### Dev values file (values-dev.yaml)

The [values-dev.yaml example file](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-dev.yaml) define a deployment with the following characteristics :

- 1 **service** named **sxapi** load balancing to pod deployed
- 1 **deployment** named **sxapi** deploying **1 pod** from version **latest** sxapi image running the **dev:start** command with :
  - debug enabled
  - **/** : homepage with html content
  - **/health** : health page
  - **/info** : description of the micro-service
  - **/ping** : return a pong message
- 2 **configMap** for application instance configuration
  - **lib** : Versionned content of the sxapi configuration file and related content
  - **app** : Environment variable describing the application deployed in version *0.0.2-devel*

```bash
# base configuration running dev configuration
helm install startx/sxapi -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-dev.yaml
```

### Test values file (values-test.yaml)

The [values-test.yaml example file](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-test.yaml) define a deployment with the following characteristics :

- 1 **service** named **sxapi** load balancing to pod deployed
- 1 **deployment** named **sxapi** deploying **1 pod** from version **testing** sxapi image running the **prod:start** command with :
  - debug enabled
  - **/** : homepage with html content
  - **/health** : health page
  - **/info** : description of the micro-service
  - **/ping** : return a pong message
- 2 **configMap** for application instance configuration
  - **lib** : Versionned content of the sxapi configuration file and related content
  - **app** : Environment variable describing the application deployed in version *0.0.1-testing*

```bash
# base configuration running dev configuration
helm install startx/sxapi -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-test.yaml
```

### Pre-prod-v1 values file (values-pprod-v1.yaml)

The [values-pprod-v1.yaml example file](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-pprod-v1.yaml) define a deployment with the following characteristics :

- 1 **service** named **sxapi** load balancing to pod deployed
- 1 **deployment** named **sxapi** deploying **1 pod** from version **0.3.57** sxapi image running the **prod:start** command with :
  - debug disabled
  - **/** : homepage with html content
  - **/health** : health page
  - **/info** : description of the micro-service
- 2 **configMap** for application instance configuration
  - **lib** : Versionned content of the sxapi configuration file and related content
  - **app** : Environment variable describing the application deployed in version *0.0.1*

```bash
# base configuration running dev configuration
helm install startx/sxapi -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-pprod-v1.yaml
```

### Prod-v1 values file (values-prod-v1.yaml)

The [values-prod-v1.yaml example file](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-prod-v1.yaml) define a deployment with the following characteristics :

- 1 **service** named **sxapi** load balancing to pod deployed
- 1 **deployment** named **sxapi** deploying **1 pod** from version **0.3.57** sxapi image running the **prod:start** command with :
  - debug disabled
  - **/** : homepage with html content
  - **/health** : health page
  - **/info** : description of the micro-service
- 2 **configMap** for application instance configuration
  - **lib** : Versionned content of the sxapi configuration file and related content
  - **app** : Environment variable describing the application deployed in version *0.0.1*

```bash
# base configuration running dev configuration
helm install startx/sxapi -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-prod-v1.yaml
```

### Pre-prod-v2 values file (values-pprod-v2.yaml)

The [values-pprod-v2.yaml example file](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-pprod-v2.yaml) define a deployment with the following characteristics :

- 1 **service** named **sxapi** load balancing to pod deployed
- 1 **deployment** named **sxapi** deploying **1 pod** from version **0.3.58** sxapi image running the **prod:start** command with :
  - debug disabled
  - **/** : homepage with html content
  - **/health** : health page
  - **/info** : description of the micro-service
  - **/ping** : return a pong message
- 2 **configMap** for application instance configuration
  - **lib** : Versionned content of the sxapi configuration file and related content
  - **app** : Environment variable describing the application deployed in version *0.0.2*

```bash
# base configuration running dev configuration
helm install startx/sxapi -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/sxapi/values-pprod-v2.yaml
```

## History

| Release | Date       | Description                                                                                            |
| ------- | ---------- | ------------------------------------------------------------------------------------------------------ |
| 0.2.51  | 2020-10-31 | Initial commit for this chart with default and dev value examples                                      |
| 0.2.99  | 2020-10-31 | Prepare release 0.3.0                                                                                  |
| 0.3.0   | 2020-10-31 | Stable 0.3 release                                                                                     |
| 0.3.1   | 2020-11-01 | Move to go templates for notes generation and move app content to value property sxapi.data            |
| 0.3.3   | 2020-11-01 | Test new scope for note template helper                                                                |
| 0.3.21  | 2020-11-06 | Align all charts on the repository release 0.3.21                                                      |
| 0.3.23  | 2020-11-07 | Add engineVersion to all chart (set to 4.5.12) and update all appVersion with the relevant information |
| 0.3.51  | 2020-11-08 | Improve sxapi options                                                                                  |
| 0.3.65  | 2020-11-09 | Align sxapi to same release as basic helm chart in startx repository                                   |
| 0.3.81  | 2020-11-10 | Improve sxapi options                                                                                  |
| 0.3.119 | 2020-11-13 | Add route support with expose proerties in the values files                                            |
| 0.3.131 | 2020-11-14 | Debug route apiVersion                                                                                 |
| 0.3.135 | 2020-11-23 | Improve documentation for all examples charts                                                          |
| 0.3.141 | 2020-11-24 | publish stable update for the full repository                                                          |
| 0.3.142 | 2021-01-23 | Update for OCP 4.6.13                                                                                  |
| 0.3.151 | 2021-01-23 | Upgrade chart to OCP version 4.3.13                                                                    |
| 0.3.153 | 2021-01-23 | publish stable update for the full repository                                                          |
| 0.3.155 | 2021-01-23 | Align sxapi chart to 0.3.155 release                                                                   |
| 0.3.165 | 2021-01-23 | Upgrade all chart dependencies                                                                         |
| 0.3.167 | 2021-01-24 | Remove conditional dependencies for argocd compatibility in HA environments                            |
| 0.3.169 | 2021-01-24 | Move to 0.3.155 dependencies                                                                           |
| 0.3.171 | 2021-01-24 | Align basic chart release to 0.3.171                                                                   |
| 0.3.187 | 2021-02-13 | Align basic chart release to 0.3.187                                                                   |
| 0.3.189 | 2021-02-13 | Align all basic charts to 0.3.189                                                                      |
| 0.3.191 | 2021-02-13 | Update cluster chart dependencies to 0.3.189                                                           |
| 0.3.193 | 2021-02-20 | Stable base helm-chart                                                                                 |
| 0.3.199 | 2021-02-20 | prepare alpha release of 0.4 and update dependencies charts                                            |
| 0.3.201 | 2021-02-20 | Update icon and image for charts                                                                       |
| 0.3.203 | 2021-02-21 | Upgrade chart release informations                                                                     |
| 0.3.205 | 2021-04-19 | Align release of core charts                                                                           |
| 0.3.207 | 2021-04-19 | Core chart dependencies moved to v0.3.205                                                              |
| 0.3.209 | 2021-05-06 | Prepare upgrade to 4.7 and add template for AFD                                                        |
| 0.3.215 | 2021-05-06 | Align all chart to release 0.3.215                                                                     |
| 0.3.217 | 2021-05-10 | Align basic chart to release 0.3.217                                                                   |
| 0.3.225 | 2021-05-10 | Update all chart to use new RBAC naming                                                                |
| 0.3.305 | 2021-06-04 | publish stable update for the full repository                                                          |
| 0.3.343 | 2021-06-06 | publish stable update for the full repository                                                          |
| 0.3.381 | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                           |
| 0.3.390 | 2021-06-12 | Prepare 0.4.0 release
| 0.3.423 | 2021-06-17 | Prepare the v0.4 release. Stable aligned version of all charts
| 0.3.425 | 2021-07-03 | Debug route and service definitions
| 0.3.431 | 2021-07-05 | Move to dependencies 1.18.0
| 0.3.480 | 2021-08-03 | publish stable update for the full repository
| 0.3.998 | 2021-08-04 | publish stable update for the full repository
| 0.3.999 | 2021-08-04 | Release stable version 0.3.999 align with ocp 4.7.13
| 7.22.1 | 2021-08-04 | Move to release 7.22.1 to align versionning with ocp release cycle
| 7.22.2 | 2021-08-04 | Move helm dependencies to a 7.x.x release model
| 7.22.3 | 2021-08-05 | publish stable update for the full repository
| 7.22.5 | 2021-08-05 | publish stable update for the full repository
| 7.22.6 | 2021-08-05 | Stable version for chart dependencies
| 7.22.7 | 2021-08-05 | Stable for OCP version 4.7.22
| 7.22.12 | 2021-09-23 | publish stable update for the full repository
| 7.22.15 | 2021-10-05 | Align core charts to release 7.22.15
| 7.22.21 | 2021-10-05 | ServiceAccount and ImagePullSecrets managed by project chart
| 7.22.23 | 2021-10-06 | Align basic charts to version 7.22.23
| 7.22.25 | 2021-10-06 | publish stable update for the full repository
| 7.22.27 | 2021-10-06 | publish stable update for the full repository
| 8.13.1 | 2021-10-06 | Stable release for OCP 4.8.13 version
| 8.13.3 | 2021-10-08 | Improve code execution, syntax and introduce the ACS helm-chart
| 8.13.5 | 2021-10-21 | publish stable update for the full repository
| 8.13.7 | 2021-10-21 | publish stable update for the full repository
| 8.13.8 | 2021-10-21 | Adding first draft of json schema
| 8.13.9 | 2021-10-22 | Adding the schema in chart
| 8.13.9 | 2021-10-22 | Improve artfifacthub annotation
| 8.13.10 | 2021-10-22 | Improve artfifacthub annotation
| 8.13.13 | 2021-10-30 | Improve the values.schema.json
| 8.13.14 | 2021-10-31 | Adding support for LoadBalancer, NodePort and ingress external access
| 8.13.15 | 2021-10-31 | Improve ci/cd workflow capactities
| 8.13.16 | 2021-10-31 | Improve sxapi options
| 8.13.21 | 2021-11-01 | Align basic charts to version 8.13.21
| 8.13.23 | 2021-11-10 | Solve helm issue in the kubeVersion for kube clusters

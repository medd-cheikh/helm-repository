# Example catalog

This helm chart is chart used to deploy various example of application used in Startx demo and mostly based on [sxapi helm chart](https://helm-repository.readthedocs.io/en/latest/charts/sxapi) microservice framework.

This chart is part of the [example-xxx startx helm chart series](https://helm-repository.readthedocs.io#examples-helm-charts) focused on deploying various kind of application consuming the cluster services deployed using the [cluster-xxx charts](https://helm-repository.readthedocs.io#cluster-helm-charts).

## Requirements and guidelines

Read the [startx helm-repository homepage](https://helm-repository.readthedocs.io)  for
more information on how to use theses resources.

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
helm show chart startx/example-catalog
```

### 4. Install this chart

```bash
helm install startx/example-catalog
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

### example-catalog values dictionary

| Key                   | Default    | Description                                           |
| --------------------- | ---------- | ----------------------------------------------------- |
| sxapi.service.enabled | false      | Enable service for this application                   |
| sxapi.version         | 0.3.57     | Sxapi image version to run                            |
| sxapi.profile         | prod:start | Profile to run inside the container                   |
| sxapi.debug           | true       | Enable debuging of the container                      |
| sxapi.replicas        | 1          | Define the number of replicas for this sxapi instance |
| sxapi.data            | string     | Files to load into the application                    |

## Values files

### Default values file (values.yaml)

Complete deployment of an sxapi application with the following characteristics :

- 1 **service** named **example-catalog** load balancing to pod deployed
- 1 **deployment** named **example-catalog** deploying **1 pod** from version **0.3.57** sxapi image running the **prod:start** command with debug disabled
- 2 **configMap** holding sxapi configuration and pod environment variable context

```bash
# base configuration running default configuration
helm install startx/example-catalog
```

### Development values file (values-dev.yaml)

Complete deployment of a sxapi development application with the following characteristics :

- 1 **service** named **example-catalog-dev** load balancing to pod deployed
- 1 **deployment** named **example-catalog-dev** deploying **1 pod** from version **0.3.57** sxapi image running the **dev:start** command with debug disabled
- 2 **configMap** holding sxapi configuration and pod environment variable context

```bash
# base configuration running tekton v1.0.1 configuration
helm install startx/example-catalog -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/example-catalog/values-dev.yaml
```

## History

| Release | Date       | Description                                                                                    |
| ------- | ---------- | ---------------------------------------------------------------------------------------------- |
| 0.3.225 | 2021-05-29 | Create chart example-catalog from example-sxapi                                                |
| 0.3.227 | 2021-05-29 | Add the storage_context demo resources                                                         |
| 0.3.228 | 2021-05-29 | Add storage block and context demo                                                             |
| 0.3.229 | 2021-05-29 | Debug block example                                                                            |
| 0.3.231 | 2021-05-30 | Add storage demo to the example catalog                                                        |
| 0.3.232 | 2021-05-30 | Add various demo to catalog                                                                    |
| 0.3.305 | 2021-06-04 | publish stable update for the full repository                                                  |
| 0.3.343 | 2021-06-06 | publish stable update for the full repository                                                  |
| 0.3.381 | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                   |
| 0.3.390 | 2021-06-12 | Prepare 0.4.0 release                                                                          |
| 0.3.391 | 2021-06-13 | Adding the priority demo to demo catalog                                                       |
| 0.3.423 | 2021-06-17 | Prepare the v0.4 release. Stable aligned version of all charts                                 |
| 0.3.431 | 2021-07-05 | Move to dependencies 1.18.0                                                                    |
| 0.3.480 | 2021-08-03 | publish stable update for the full repository                                                  |
| 0.3.998 | 2021-08-04 | publish stable update for the full repository                                                  |
| 0.3.999 | 2021-08-04 | Release stable version 0.3.999 align with ocp 4.7.13                                           |
| 7.22.1  | 2021-08-04 | Move to release 7.22.1 to align versionning with ocp release cycle                             |
| 7.22.2  | 2021-08-04 | Move helm dependencies to a 7.x.x release model                                                |
| 7.22.3  | 2021-08-05 | publish stable update for the full repository                                                  |
| 7.22.5  | 2021-08-05 | publish stable update for the full repository                                                  |
| 7.22.6  | 2021-08-05 | Stable version for chart dependencies                                                          |
| 7.22.7  | 2021-08-05 | Stable for OCP version 4.7.22                                                                  |
| 7.22.12 | 2021-09-23 | publish stable update for the full repository                                                  |
| 7.22.21 | 2021-10-05 | ServiceAccount and ImagePullSecrets managed by project chart                                   |
| 7.22.25 | 2021-10-06 | publish stable update for the full repository                                                  |
| 7.22.27 | 2021-10-06 | publish stable update for the full repository                                                  |
| 8.13.1  | 2021-10-06 | Stable release for OCP 4.8.13 version                                                          |
| 8.13.3  | 2021-10-08 | Improve code execution, syntax and introduce the ACS helm-chart                                |
| 8.13.5  | 2021-10-21 | publish stable update for the full repository                                                  |
| 8.13.7  | 2021-10-21 | publish stable update for the full repository                                                  |
| 8.13.8  | 2021-10-21 | Adding first draft of json schema                                                              |
| 8.13.9  | 2021-10-22 | Adding the schema in chart                                                                     |
| 8.13.25 | 2021-11-10 | Solve helm issue in the kubeVersion for kube clusters and upgrade chart dep to version 8.13.23 |
| 8.13.27 | 2021-11-10 | publish stable update for the full repository
| 8.20.3 | 2021-11-11 | Align all charts to Openshift version 4.8.20
| 8.20.5 | 2021-11-12 | Upgrade all appVersion and align chart release
| 8.20.9 | 2021-11-12 | Align all startx chart to version 8.20.9
| 0.20.11 | 2021-11-12 | Move chart dependencies to version 8.20.5
| 0.20.33 | 2021-11-14 | publish stable update for the full repository
| 0.20.41 | 2021-11-14 | Aling all dependencies to version 0.20.34
| 8.20.46 | 2021-11-19 | Transitionnal chart
| 8.20.60 | 2021-11-19 | publish stable update for the full repository
| 8.20.66 | 2021-11-20 | Updating limits for context vars in values schema
| 8.20.70 | 2021-11-20 | publish stable update for the full repository
| 8.20.71 | 2021-11-20 | Align all charts to Openshift version 4.8.21

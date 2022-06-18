# Example couchbase

This helm chart is used to create a deployment of a small PHP webserver based on [startx apache PHP image](https://quay.io/startx/couchbase).

This chart is part of the [example-xxx startx helm chart series](https://helm-repository.readthedocs.io#examples-helm-charts) focused on deploying various kind of application consuming the cluster services deployed using the [cluster-xxx charts](https://helm-repository.readthedocs.io#cluster-helm-charts).

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
helm repo add startx https://startxfr.github.io/helm-repository/packages/
```

### 3. Get information about this chart

```bash
helm show chart startx/example-couchbase
```

### 4. Install this chart

```bash
helm install example-couchbase startx/example-couchbase
```

## Values dictionary

### context values dictionary

| Key                 | Default   | Description                                                                       |
| ------------------- | --------- | --------------------------------------------------------------------------------- |
| context.scope       | default   | Name of the global scope for this application (organisational tenant)             |
| context.cluster     | localhost | Name of the cluster running this application (plateform tenant)                   |
| context.environment | dev       | Name of the environement for this application (ex: dev, factory, preprod or prod) |
| context.component   | demo      | Component name of this application (logical tenant)                               |
| context.app         | couchbase | Application name (functionnal tenant, default use Chart name)                     |
| context.version     | 0.0.1     | Version name of this application (default use Chart appVersion)                   |

### example-couchbase values dictionary

| Key                       | Default    | Description                                               |
| ------------------------- | ---------- | --------------------------------------------------------- |
| couchbase.service.enabled | false      | Enable service for this application                       |
| couchbase.version         | 0.3.63     | Sxapi image version to run                                |
| couchbase.profile         | prod:start | Profile to run inside the container                       |
| couchbase.debug           | true       | Enable debuging of the container                          |
| couchbase.replicas        | 1          | Define the number of replicas for this couchbase instance |
| couchbase.data            | string     | Files to load into the application                        |

## Values files

### Default values file (values.yaml)

Complete deployment of an couchbase application with the following characteristics :

- 1 **service** named **example-couchbase** load balancing to pod deployed
- 1 **deployment** named **example-couchbase** deploying **1 pod** from version **0.3.63** couchbase image running the **prod:start** command with debug disabled
- 2 **configMap** holding couchbase configuration and pod environment variable context

```bash
# base configuration running default configuration
helm install example-couchbase startx/example-couchbase
```

### Development values file (values-demo-hpa.yaml)

Complete deployment of a couchbase demo application for stress test (used in HPA test) with the following characteristics :

- 1 **service** named **hpa-app** load balancing to pod deployed
- 1 **deployment** named **hpa-app** deploying **2 pod** from version **fc35** couchbase image running with debug disabled
- 2 **configMap** holding couchbase configuration and pod environment variable context

```bash
# base configuration running tekton v1.0.1 configuration
helm install example-couchbase startx/example-couchbase -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/example-couchbase/values-demo-hpa.yaml
```

## History

| Release | Date       | Description                                                                                    |
| ------- | ---------- | ---------------------------------------------------------------------------------------------- |
| 0.3.203 | 2021-02-22 | Create chart example-couchbase from example-sxapi                                              |
| 0.3.207 | 2021-04-19 | Core chart dependencies moved to v0.3.205                                                      |
| 0.3.209 | 2021-05-06 | Prepare upgrade to 4.7 and add template for AFD                                                |
| 0.3.215 | 2021-05-06 | Align all chart to release 0.3.215                                                             |
| 0.3.225 | 2021-05-10 | Update all chart to use new RBAC naming                                                        |
| 0.3.305 | 2021-06-04 | publish stable update for the full repository                                                  |
| 0.3.343 | 2021-06-06 | publish stable update for the full repository                                                  |
| 0.3.381 | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                   |
| 0.3.390 | 2021-06-12 | Prepare 0.4.0 release                                                                          |
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
| 8.13.6  | 2021-10-21 | Move default image to fc35 flavour                                                             |
| 8.13.7  | 2021-10-21 | publish stable update for the full repository                                                  |
| 8.13.8  | 2021-10-21 | Adding first draft of json schema                                                              |
| 8.13.9  | 2021-10-22 | Adding the schema in chart                                                                     |
| 8.13.25 | 2021-11-10 | Solve helm issue in the kubeVersion for kube clusters and upgrade chart dep to version 8.13.23 |
| 8.13.27 | 2021-11-10 | publish stable update for the full repository                                                  |
| 8.20.3  | 2021-11-11 | Align all charts to Openshift version 4.8.20                                                   |
| 8.20.5  | 2021-11-12 | Upgrade all appVersion and align chart release                                                 |
| 8.20.9  | 2021-11-12 | Align all startx chart to version 8.20.9                                                       |
| 0.20.11 | 2021-11-12 | Move chart dependencies to version 8.20.5                                                      |
| 0.20.33 | 2021-11-14 | publish stable update for the full repository                                                  |
| 0.20.41 | 2021-11-14 | Aling all dependencies to version 0.20.34                                                      |
| 8.20.46 | 2021-11-19 | Transitionnal chart                                                                            |
| 8.20.60 | 2021-11-19 | publish stable update for the full repository                                                  |
| 8.20.66 | 2021-11-20 | Updating limits for context vars in values schema                                              |
| 8.20.70 | 2021-11-20 | publish stable update for the full repository                                                  |
| 8.20.71 | 2021-11-20 | Align all charts to Openshift version 4.8.21                                                   |
| 9.8.1   | 2021-11-20 | Upgrade to Openshift version 4.9.8                                                             |
| 9.8.4   | 2021-11-20 | Stable release of chart for Openshift 4.9.8 version                                            |
| 9.8.7   | 2021-11-20 | Debug dependencies problem                                                                     |
| 9.8.9   | 2021-11-20 | Update startx chart dependencies version to 9.8.8 and schema update                            |
| 9.8.15  | 2021-11-20 | Update startx chart dependencies version to 9.8.11                                             |
| 9.8.19  | 2021-11-20 | Update startx chart dependencies version to 9.8.15 and improve values schema                   |
| 9.8.28  | 2021-11-20 | Update the startx chart dependencies to version 9.8.23                                         |
| 9.8.39  | 2021-11-21 | Debug version check with more permissive mode                                                  |
| 9.8.43  | 2021-11-21 | Update the startx chart dependencies to version 9.8.39                                         |
| 9.8.45  | 2021-11-21 | Update the values schema limits for context properties                                         |
| 9.8.47  | 2021-11-21 | Improve version management for chart                                                           |
| 9.8.48  | 2021-11-22 | Update sxapi to version 0.3.63 with many security updates                                      |
| 9.8.51  | 2021-11-22 | Update startx chart dependencies to version 9.8.48                                             |
| 9.8.67  | 2021-12-18 | Align all charts to release 9.8.67                                                             |
| 9.8.71  | 2021-12-18 | Update helm-chart dependencies to version 9.8.59                                               |
| 9.8.75  | 2021-12-19 | Align with all other startx chart version to number 9.8.75                                     |
| 9.8.76  | 2021-12-19 | Change helm.sh/chart name                                                                      |
| 9.8.81  | 2021-12-20 | Update the storage context                                                                     |
| 9.8.91  | 2022-03-06 | publish stable update for the full repository                                                  |
| 9.8.93  | 2022-03-07 | Enable conditionnal loading of charts dependencies                                             |
| 9.8.109 | 2022-04-26 | Update startx chart dependencies to version 9.8.107                                            |
| 9.8.110 | 2022-04-27 | Stable release for all charts                                                                  |
| 9.8.215 | 2022-05-06 | Upgrade startx chart dependencies to version 9.8.211
| 9.8.230 | 2022-05-06 | Stable full repository
| 9.8.231 | 2022-05-06 | Debug basic chart dependencies
| 9.8.233 | 2022-05-06 | publish stable update for the full repository
| 9.8.239 | 2022-05-17 | Remove default csv from all charts. global release 9.8.239
| 9.8.253 | 2022-05-29 | Align all charts dependencies to release 9.8.251
| 9.8.277 | 2022-05-31 | publish stable update for the full repository
| 9.15.1 | 2022-06-01 | Align all chart for Openshift 4.9.15
| 9.15.2 | 2022-06-01 | Align all charts to release 9.15.1
| 9.15.3 | 2022-06-01 | Align all charts to release 9.15.3
| 10.12.1 | 2022-06-01 | Align all charts to release 10.12.1
| 10.12.3 | 2022-06-01 | publish stable update for the full repository
| 10.12.4 | 2022-06-01 | Align all charts to release 10.12.4
| 10.12.5 | 2022-06-01 | publish stable update for the full repository
| 10.12.22 | 2022-06-04 | Align all chart to release version 10.12.22
| 10.12.23 | 2022-06-04 | Basi chart dependencies upgraded to version 10.12.5
| 10.12.29 | 2022-06-17 | Align all charts to version 10.12.29
| 10.12.29 | 2022-06-17 | publish stable update for the full repository
| 10.12.30 | 2022-06-17 | Improved logo and global documentation
| 10.12.33 | 2022-06-17 | publish stable update for the full repository
| 10.12.34 | 2022-06-17 | Align all dependencies charts to 10.12.31
| 10.12.41 | 2022-06-18 | Align all charts to version 10.12.41
| 10.12.46 | 2022-06-18 | publish stable update for the full repository
| 10.12.49 | 2022-06-18 | publish stable update for the full repository

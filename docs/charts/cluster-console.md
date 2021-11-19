# Cluster console

This helm chart is used to configure openshift console at the cluster level.
This chart is part of the [cluster-xxx startx helm chart series](https://helm-repository.readthedocs.io#cluster-helm-charts) that doesn't necessarily deployment pod but rather represent a cluster configuration state orchestrated by gitops tools like ArgoCD.

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
helm show chart startx/cluster-console
```

### 4. Install this chart

```bash
helm install startx/cluster-console
```

## Default values

Complete deployment of a project with the following characteristics :

xxxx to do xxxxxx

```bash
# base configuration running default configuration
helm install startx/cluster-console
```

## Others values availables

- **startx** : Startx Openshift Console customization (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-console/values-startx.yaml))

```bash
helm install startx/cluster-console -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-console/values-startx.yaml
```

## History

| Release | Date       | Description                                                                                                      |
| ------- | ---------- | ---------------------------------------------------------------------------------------------------------------- |
| 0.3.21  | 2020-11-07 | Create chart cluster-console from cluster-auth with logo customisation as well as notification, link and logLink |
| 0.3.23  | 2020-11-07 | Add engineVersion to all chart (set to 4.5.12) and update all appVersion with the relevant information           |
| 0.3.47  | 2020-11-08 | Update dependency to 0.3.45 release                                                                              |
| 0.3.93  | 2020-11-10 | Move to 0.3.93 dependencies for all cluster-xxx charts in the startx repository                                  |
| 0.3.105 | 2020-11-11 | Update cluster-xxx charts dependencies to 0.3.103 release                                                        |
| 0.3.117 | 2020-11-12 | Move to 0.3.115 basic chart dependencies                                                                         |
| 0.3.135 | 2020-11-23 | Improve documentation for all examples charts                                                                    |
| 0.3.141 | 2020-11-24 | publish stable update for the full repository                                                                    |
| 0.3.151 | 2021-01-23 | Upgrade to OCP version 4.6.13                                                                                    |
| 0.3.151 | 2021-01-23 | Upgrade chart to OCP version 4.3.13                                                                              |
| 0.3.153 | 2021-01-23 | publish stable update for the full repository                                                                    |
| 0.3.165 | 2021-01-23 | Upgrade all chart dependencies                                                                                   |
| 0.3.167 | 2021-01-24 | Remove conditional dependencies for argocd compatibility in HA environments                                      |
| 0.3.169 | 2021-01-24 | Move to 0.3.155 dependencies                                                                                     |
| 0.3.187 | 2021-02-13 | Align cluster chart release to 0.3.187                                                                           |
| 0.3.191 | 2021-02-13 | Update cluster chart dependencies to 0.3.189                                                                     |
| 0.3.199 | 2021-02-20 | prepare alpha release of 0.4 and update dependencies charts                                                      |
| 0.3.201 | 2021-02-20 | Update icon and image for charts                                                                                 |
| 0.3.203 | 2021-02-21 | Upgrade chart release informations                                                                               |
| 0.3.207 | 2021-04-19 | Core chart dependencies moved to v0.3.205                                                                        |
| 0.3.209 | 2021-05-06 | Prepare upgrade to 4.7 and add template for AFD                                                                  |
| 0.3.215 | 2021-05-06 | Align all chart to release 0.3.215                                                                               |
| 0.3.225 | 2021-05-10 | Update all chart to use new RBAC naming                                                                          |
| 0.3.303 | 2021-06-02 | Update documentation and align all charts to release 0.3.303                                                     |
| 0.3.311 | 2021-06-03 | Align cluster chart to version 0.3.311                                                                           |
| 0.3.305 | 2021-06-04 | publish stable update for the full repository                                                                    |
| 0.3.343 | 2021-06-06 | publish stable update for the full repository                                                                    |
| 0.3.381 | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                                     |
| 0.3.390 | 2021-06-12 | Prepare 0.4.0 release
| 0.3.423 | 2021-06-17 | Prepare the v0.4 release. Stable aligned version of all charts
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
| 7.22.21 | 2021-10-05 | ServiceAccount and ImagePullSecrets managed by project chart
| 7.22.25 | 2021-10-06 | publish stable update for the full repository
| 7.22.27 | 2021-10-06 | publish stable update for the full repository
| 8.13.1 | 2021-10-06 | Stable release for OCP 4.8.13 version
| 8.13.3 | 2021-10-08 | Improve code execution, syntax and introduce the ACS helm-chart
| 8.13.5 | 2021-10-21 | publish stable update for the full repository
| 8.13.7 | 2021-10-21 | publish stable update for the full repository
| 8.13.8 | 2021-10-21 | Adding first draft of json schema
| 8.13.9 | 2021-10-22 | Adding the schema in chart
| 8.13.9 | 2021-10-22 | Adding the schema in chart
| 8.13.25 | 2021-11-10 | Solve helm issue in the kubeVersion for kube clusters and upgrade chart dep to version 8.13.23
| 8.13.27 | 2021-11-10 | publish stable update for the full repository
| 8.20.3 | 2021-11-11 | Align all charts to Openshift version 4.8.20
| 8.20.3 | 2021-11-11 | stable release for all chart for openshift version 4.8.20
| 8.20.5 | 2021-11-12 | Upgrade all appVersion and align chart release
| 8.20.7 | 2021-11-12 | Upgrade all schema for context subtree
| 8.20.9 | 2021-11-12 | Align all startx chart to version 8.20.9
| 0.20.11 | 2021-11-12 | Move chart dependencies to version 8.20.5
| 0.20.33 | 2021-11-14 | publish stable update for the full repository
| 0.20.41 | 2021-11-14 | Aling all dependencies to version 0.20.34
| 8.20.46 | 2021-11-19 | Transitionnal chart
| 8.20.60 | 2021-11-19 | publish stable update for the full repository

# Cluster logging

This helm chart is used to configure Metering at the cluster level.
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
helm show chart startx/cluster-logging
```

### 4. Install this chart

```bash
helm install startx/cluster-logging
```

## Default values

Complete deployment of a project with the following characteristics :

xxxx to do xxxxxx

## History

| Release | Date       | Description                                                                                                      |
| ------- | ---------- | ---------------------------------------------------------------------------------------------------------------- |
| 0.3.19  | 2020-11-06 | Create chart cluster-logging from cluster-metering (removed)                                                     |
| 0.3.21  | 2020-11-06 | Align all charts on the repository release 0.3.21 (removed)                                                      |
| 0.3.23  | 2020-11-07 | Add engineVersion to all chart (set to 4.5.12) and update all appVersion with the relevant information (removed) |
| 0.3.29  | 2020-11-07 | Improve NOTES output and move to 0.3.25 dependencies (removed)                                                   |
| 0.3.37  | 2020-11-07 | Improve helm hook ordering cordinated with dependencies                                                          |
| 0.3.117 | 2020-11-12 | Move to 0.3.115 basic chart dependencies                                                                         |
| 0.3.135 | 2020-11-23 | Improve documentation for all examples charts                                                                    |
| 0.3.141 | 2020-11-24 | publish stable update for the full repository                                                                    |
| 0.3.151 | 2021-01-23 | Upgrade lo Logging verison 4.6.0                                                                                 |
| 0.3.151 | 2021-01-23 | Upgrade chart to OCP version 4.3.13                                                                              |
| 0.3.153 | 2021-01-23 | publish stable update for the full repository                                                                    |
| 0.3.165 | 2021-01-23 | Upgrade all chart dependencies                                                                                   |
| 0.3.167 | 2021-01-24 | Remove conditional dependencies for argocd compatibility in HA environments                                      |
| 0.3.169 | 2021-01-24 | Move to 0.3.155 dependencies                                                                                     |
| 0.3.173 | 2021-01-24 | Move all dependencies to 0.3.171 and improve cluster-logging component                                           |
| 0.3.187 | 2021-02-13 | Align cluster chart release to 0.3.187                                                                           |
| 0.3.191 | 2021-02-13 | Update cluster chart dependencies to 0.3.189                                                                     |
| 0.3.199 | 2021-02-20 | prepare alpha release of 0.4 and update dependencies charts                                                      |
| 0.3.201 | 2021-02-20 | Update icon and image for charts                                                                                 |
| 0.3.203 | 2021-02-21 | Upgrade chart release informations                                                                               |
| 0.3.207 | 2021-04-19 | Core chart dependencies moved to v0.3.205                                                                        |
| 0.3.209 | 2021-05-06 | Prepare upgrade to 4.7 and add template for AFD                                                                  |
| 0.3.215 | 2021-05-06 | Align all chart to release 0.3.215                                                                               |
| 0.3.217 | 2021-05-06 | Move to elastic operator version 5.0.2-18 (OCP 4.7 compat)                                                       |
| 0.3.219 | 2021-05-06 | Move to elastic operator version 5.0.3-6 (OCP 4.7 compat)                                                        |
| 0.3.221 | 2021-05-06 | Move to logging operator version 5.0.3-6 (OCP 4.7 compat)                                                        |
| 0.3.225 | 2021-05-10 | Update all chart to use new RBAC  naming                                                                         |
| 0.3.227 | 2021-05-27 | Update elastic operator to 5.0.4-21                                                                              |
| 0.3.228 | 2021-06-02 | Change csv name to align global naming convention defined by redhat                                              |
| 0.3.305 | 2021-06-04 | publish stable update for the full repository                                                                    |
| 0.3.343 | 2021-06-06 | publish stable update for the full repository                                                                    |
| 0.3.381 | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                                     |
| 0.3.390 | 2021-06-12 | Prepare 0.4.0 release                                                                                            |
| 0.3.423 | 2021-06-17 | Prepare the v0.4 release. Stable aligned version of all charts                                                   |
| 0.3.424 | 2021-06-19 | Update to logging operator version 5.0.5-11
| 0.3.431 | 2021-07-05 | Move to dependencies 1.18.0
| 0.3.441 | 2021-07-27 | Update logging operator to version 5.1.0-75
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
| 8.20.5 | 2021-11-12 | Upgrade all appVersion and align chart release
| 8.20.9 | 2021-11-12 | Align all startx chart to version 8.20.9
| 0.20.11 | 2021-11-12 | Move chart dependencies to version 8.20.5
| 0.20.33 | 2021-11-14 | publish stable update for the full repository
| 0.20.41 | 2021-11-14 | Aling all dependencies to version 0.20.34
| 8.20.46 | 2021-11-19 | Transitionnal chart
| 8.20.60 | 2021-11-19 | publish stable update for the full repository
| 8.20.66 | 2021-11-20 | Updating limits for context vars in values schema
| 8.20.67 | 2021-11-20 | Debug resources type in values schema
| 8.20.68 | 2021-11-20 | Update to openshift-logging operator release 5.3.0-55
| 8.20.69 | 2021-11-20 | Update elasticsearch operator to release 5.3.0-67
| 8.20.70 | 2021-11-20 | publish stable update for the full repository
| 8.20.71 | 2021-11-20 | Align all charts to Openshift version 4.8.21
| 9.8.1 | 2021-11-20 | Upgrade to Openshift version 4.9.8
| 9.8.4 | 2021-11-20 | Stable release of chart for Openshift 4.9.8 version
| 9.8.7 | 2021-11-20 | Debug dependencies problem
| 9.8.9 | 2021-11-20 | Update startx chart dependencies version to 9.8.8 and schema update
| 9.8.15 | 2021-11-20 | Update startx chart dependencies version to 9.8.11
| 9.8.19 | 2021-11-20 | Update startx chart dependencies version to 9.8.15 and improve values schema

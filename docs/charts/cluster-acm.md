# Cluster ACM

This helm chart must have a description

## Install the repository

```bash
helm repo add startx https://startxfr.github.io/helm-repository/packages/
```

## Get information about this chart

```bash
helm show chart cluster-acm startx/cluster-acm
```

## Install this chart

```bash
helm install cluster-acm startx/cluster-acm
```

## Default values

Complete deployment of a project with the following characteristics :

- 1 **project:** named **open-cluster-management** with the following properties
  - 1 **LimitRange:** defined for this projet
  - 1 **Quotas:** defined for this projet
  - 3 **RBAC:** allowing **mygroup_example** to **edit** resources
- 1 **operator:** named **advanced-cluster-management** configured with
  - The **release-2.4** channel
  - The **2.4.0** version
  - Deployed under the **open-cluster-management** project
  - The **manager** deployed
- 1 **mch:** named **default-mch** configured with
  - **hive** enabled
  - **ingress** enabled

```bash
# base configuration running default configuration
helm install cluster-acm startx/cluster-acm
```

## Others values availables

- **startx** : Startx ACM cluster wide service configuration using startx group (dev, devops and ops) (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-acm/values-startx.yaml))

```bash
helm install cluster-acm startx/cluster-acm -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-acm/values-startx.yaml
```

## History

| Release | Date       | Description                                                                                    |
| ------- | ---------- | ---------------------------------------------------------------------------------------------- |
| 0.0.1   | 2021-01-23 | Create chart cluster-acm from _sample_                                                         |
| 0.3.151 | 2021-01-23 | Upgrade chart to OCP version 4.3.13                                                            |
| 0.3.153 | 2021-01-23 | publish stable update for the full repository                                                  |
| 0.3.165 | 2021-01-23 | Upgrade all chart dependencies                                                                 |
| 0.3.167 | 2021-01-24 | Remove conditional dependencies for argocd compatibility in HA environments                    |
| 0.3.169 | 2021-01-24 | Move to 0.3.155 dependencies                                                                   |
| 0.3.177 | 2021-01-26 | Remove example from cluster-acm                                                                |
| 0.3.187 | 2021-02-13 | Align cluster chart release to 0.3.187                                                         |
| 0.3.191 | 2021-02-13 | Update cluster chart dependencies to 0.3.189                                                   |
| 0.3.199 | 2021-02-20 | prepare alpha release of 0.4 and update dependencies charts                                    |
| 0.3.201 | 2021-02-20 | Update icon and image for charts                                                               |
| 0.3.203 | 2021-02-21 | Upgrade chart release informations                                                             |
| 0.3.207 | 2021-04-19 | Core chart dependencies moved to v0.3.205                                                      |
| 0.3.209 | 2021-05-06 | Prepare upgrade to 4.7 and add template for AFD                                                |
| 0.3.215 | 2021-05-06 | Align all chart to release 0.3.215                                                             |
| 0.3.225 | 2021-05-10 | Update all chart to use new RBAC naming                                                        |
| 0.3.226 | 2021-06-02 | Update RHACM operator to version 2.2.3                                                         |
| 0.3.305 | 2021-06-04 | publish stable update for the full repository                                                  |
| 0.3.343 | 2021-06-06 | publish stable update for the full repository                                                  |
| 0.3.381 | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                   |
| 0.3.382 | 2021-06-10 | Debug the availabilityConfig value                                                             |
| 0.3.390 | 2021-06-12 | Prepare 0.4.0 release                                                                          |
| 0.3.423 | 2021-06-17 | Prepare the v0.4 release. Stable aligned version of all charts                                 |
| 0.3.424 | 2021-06-19 | Update acm package                                                                             |
| 0.3.425 | 2021-06-20 | Debug package                                                                                  |
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
| 8.13.27 | 2021-11-10 | publish stable update for the full repository                                                  |
| 8.20.3  | 2021-11-11 | stable release for all chart for openshift version 4.8.20                                      |
| 8.20.5  | 2021-11-12 | Upgrade all appVersion and align chart release                                                 |
| 8.20.7  | 2021-11-12 | Upgrade all schema for context subtree                                                         |
| 8.20.9  | 2021-11-12 | Align all startx chart to version 8.20.9                                                       |
| 0.20.11 | 2021-11-12 | Move chart dependencies to version 8.20.5                                                      |
| 0.20.33 | 2021-11-14 | publish stable update for the full repository                                                  |
| 0.20.39 | 2021-11-14 | Aling all dependencies to version 0.20.34                                                      |
| 0.20.41 | 2021-11-14 | Aling all dependencies to version 0.20.34                                                      |
| 8.20.46 | 2021-11-19 | Transitionnal chart                                                                            |
| 8.20.60 | 2021-11-19 | publish stable update for the full repository                                                  |
| 8.20.66 | 2021-11-20 | Updating limits for context vars in values schema                                              |
| 8.20.67 | 2021-11-20 | Update advanced-cluster-management operator to release 2.4.0                                   |
| 8.20.70 | 2021-11-20 | publish stable update for the full repository                                                  |
| 8.20.71 | 2021-11-20 | Align all charts to Openshift version 4.8.21                                                   |
| 9.8.1   | 2021-11-20 | Upgrade to Openshift version 4.9.8                                                             |
| 9.8.4   | 2021-11-20 | Stable release of chart for Openshift 4.9.8 version                                            |
| 9.8.4   | 2021-11-20 | Stable release of chart for Openshift 4.9.8 version                                            |
| 9.8.7   | 2021-11-20 | Debug dependencies problem                                                                     |
| 9.8.9   | 2021-11-20 | Update startx chart dependencies version to 9.8.8 and schema update                            |
| 9.8.15  | 2021-11-20 | Update startx chart dependencies version to 9.8.11                                             |
| 9.8.16  | 2021-11-20 | Debug the subscription version name                                                            |
| 9.8.19  | 2021-11-20 | Update startx chart dependencies version to 9.8.15 and improve values schema                   |
| 9.8.28  | 2021-11-20 | Update the startx chart dependencies to version 9.8.23                                         |
| 9.8.28  | 2021-11-20 | Update the startx chart dependencies to version 9.8.23                                         |
| 9.8.39  | 2021-11-21 | Debug version check with more permissive mode                                                  |
| 9.8.43  | 2021-11-21 | Update the startx chart dependencies to version 9.8.39                                         |
| 9.8.45  | 2021-11-21 | Update the values schema limits for context properties                                         |
| 9.8.47  | 2021-11-21 | Improve version management for chart                                                           |
| 9.8.51  | 2021-11-22 | Update startx chart dependencies to version 9.8.48                                             |
| 9.8.67  | 2021-12-18 | Align all charts to release 9.8.67                                                             |
| 9.8.71  | 2021-12-18 | Update helm-chart dependencies to version 9.8.59                                               |
| 9.8.75  | 2021-12-19 | Align with all other startx chart version to number 9.8.75                                     |
| 9.8.76  | 2021-12-19 | Change helm.sh/chart name                                                                      |
| 9.8.81  | 2021-12-20 | Update the storage context                                                                     |
| 9.8.91  | 2022-03-06 | publish stable update for the full repository                                                  |
| 9.8.93  | 2022-03-07 | Enable conditionnal loading of charts dependencies                                             |
| 9.8.109 | 2022-04-26 | Update startx chart dependencies to version 9.8.107                                            |
| 9.8.109 | 2022-04-26 | Update startx chart dependencies to version 9.8.107                                            |
| 9.8.110 | 2022-04-27 | Stable release for all charts                                                                  |
| 9.8.111 | 2022-04-27 | publish stable update for the full repository
| 9.8.114 | 2022-04-27 | publish stable update for the full repository
| 9.8.215 | 2022-05-06 | Upgrade startx chart dependencies to version 9.8.211
| 9.8.230 | 2022-05-06 | Stable full repository
| 9.8.231 | 2022-05-06 | Debug basic chart dependencies
| 9.8.233 | 2022-05-06 | publish stable update for the full repository
| 9.8.234 | 2022-05-06 | Add observability (old cluster-thanos)
| 9.8.235 | 2022-05-06 | Improve cluster-acm options
| 9.8.236 | 2022-05-07 | Add import and create cluster support
| 9.8.237 | 2022-05-08 | Imrpove the create and import sequence
| 9.8.238 | 2022-05-13 | Improve cluster-acm options
| 9.8.239 | 2022-05-17 | Remove default csv from all charts. global release 9.8.239
| 9.8.253 | 2022-05-29 | Align all charts dependencies to release 9.8.251
| 9.8.277 | 2022-05-31 | publish stable update for the full repository
| 9.8.278 | 2022-05-31 | Improve cluster-acm options
| 9.15.1 | 2022-06-01 | Align all chart for Openshift 4.9.15
| 9.15.2 | 2022-06-01 | Align all charts to release 9.15.1
| 9.15.3 | 2022-06-01 | Align all charts to release 9.15.3
| 10.12.1 | 2022-06-01 | Align all charts to release 10.12.1
| 10.12.1 | 2022-06-01 | Align all charts to release 10.12.1
| 10.12.1 | 2022-06-01 | Align all charts to release 10.12.1
| 10.12.3 | 2022-06-01 | Align all charts to release 10.12.3
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
| 10.12.39 | 2022-06-18 | Align all chart to revision 10.12.39
| 10.12.41 | 2022-06-18 | Align all charts to version 10.12.41
| 10.12.46 | 2022-06-18 | publish stable update for the full repository
| 10.12.49 | 2022-06-18 | publish stable update for the full repository
| 10.12.53 | 2022-06-18 | publish stable update for the full repository
| 10.12.71 | 2022-06-28 | Debug the appVersion in all charts
| 10.12.72 | 2022-07-02 | Common release
| 10.12.77 | 2022-07-02 | Stable for clients
| 10.12.81 | 2022-07-02 | publish stable update for the full repository
| 10.12.97 | 2022-07-03 | publish stable update for the full repository
| 10.12.99 | 2022-09-16 | All chart are aligned to release 10.12.101
| 10.12.101 | 2022-09-16 | All chart are aligned to release 10.12.101
| 10.12.105 | 2022-09-17 | All chart are aligned to release 10.12.105

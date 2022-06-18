# Cluster Local storage

This helm chart is used to configure local storage at the cluster level.
This chart is part of the [cluster-xxx startx helm chart series](https://helm-repository.readthedlocalstorage.io#cluster-helm-charts) that doesn't necessarily deployment pod but rather represent a cluster configuration state orchestrated by gitops tools like ArgoCD.

## Requirements and guidelines

Read the [startx helm-repository homepage](https://helm-repository.readthedlocalstorage.io) for
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
helm show chart startx/cluster-localstorage
```

### 4. Install this chart

```bash
helm install startx/cluster-localstorage
```

## Default values

Complete deployment of a project with the following characteristics :

xxxx to do xxxxxx

```bash
# base configuration running default configuration
helm install startx/cluster-localstorage
```

## Others values availables

- **startx** : Startx local storage cluster wide service configuration using localstorage operator (see [values-startx.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-localstorage/values-startx.yaml))

```bash
helm install startx/cluster-localstorage -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-localstorage/values-startx.yaml
```

## History

| Release | Date       | Description                                         |
| ------- | ---------- | --------------------------------------------------- |
| 9.8.76  | 2021-12-19 | Create chart cluster-localstorage from cluster-ocs  |
| 9.8.81  | 2021-12-20 | Update the storage context                          |
| 9.8.82  | 2021-12-20 | Debug templates                                     |
| 9.8.91  | 2022-03-06 | publish stable update for the full repository       |
| 9.8.93  | 2022-03-07 | Enable conditionnal loading of charts dependencies  |
| 9.8.109 | 2022-04-26 | Update startx chart dependencies to version 9.8.107 |
| 9.8.110 | 2022-04-27 | Stable release for all charts                       |
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
| 10.12.39 | 2022-06-18 | Align all chart to revision 10.12.39

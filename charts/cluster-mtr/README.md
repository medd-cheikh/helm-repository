# ![cluster-mtr](https://helm-repository.readthedocs.io/en/latest/img/cluster-mtr.svg "Cluster Chart : MTR") Cluster Chart : MTR
[![Artifacthub](https://img.shields.io/badge/ArtifactHub-STARTX_cluster--mtr-8A2BE2.svg)](https://artifacthub.io/packages/search?ts_query_web=cluster+mtr+startx)

This helm chart is used to deploy Migration Toolkit for Runtimes operator to help you drive migration of your Java
application into kubernetes cluster.

This chart is part of the [cluster-xxx startx helm chart series](https://helm-repository.readthedocs.io#cluster-helm-charts) that doesn't necessarily deploy pods but rather represent a cluster configuration state orchestrated by gitops tools like ArgoCD.

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
helm show chart startx/cluster-mtr
```

### 4. Install this chart

```bash
helm install cluster-mtr startx/cluster-mtr
```

## Default values

Complete deployment of a project with the following characteristics :

xxxxxx TO DO xxxxxx

```bash
# base configuration running default configuration
helm install cluster-mtr startx/cluster-mtr
```

## Others values availables

- **startx** : MTR operator (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-mtr/values-startx.yaml))

```bash
helm install cluster-mtr startx/cluster-mtr -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-mtr/values-startx.yaml
```

## History

| Release  | Date       | Description                              |
| -------- | ---------- | ---------------------------------------- |
| 14.6.357 | 2025-06-29 | Initialize the MTR cluster-service chart |
| 14.6.357 | 2024-06-29 | Update the schema for mtr section
| 14.6.367 | 2024-06-29 | Align all startx charts to release 14.6.367
| 14.6.381 | 2024-06-30 | Align all startx charts to release 14.6.381
| 15.27.3 | 2024-11-06 | create init release for version 15.x
| 15.27.5 | 2024-11-06 | publish stable update for the full repository
| 15.27.7 | 2024-11-06 | Align all startx charts dependencies to release 15.27.3
| 15.27.9 | 2024-11-09 | Upgrade the MTR operator version to v1.2.7
| 15.27.17 | 2024-11-10 | Release aligned for OCP 4.15.27
| 15.27.21 | 2024-11-10 | Release aligned for OCP 4.15.37

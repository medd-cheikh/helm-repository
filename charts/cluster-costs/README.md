# ![cluster-costs](https://helm-repository.readthedocs.io/en/latest/img/cluster-costs.svg "Cluster Chart : Costs") Cluster Chart : Costs
[![Artifacthub](https://img.shields.io/badge/ArtifactHub-STARTX_cluster--costs-8A2BE2.svg)](https://artifacthub.io/packages/search?ts_query_web=cluster+costs+startx)

This helm chart is used to deploy the Cost Management operator to help you collect Cost Management Metrics Operator and report them using mail, jira or csv, tab outputs.

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
helm show chart startx/cluster-costs
```

### 4. Install this chart

```bash
helm install cluster-costs startx/cluster-costs
```

## Default values

Complete deployment of a project with the following characteristics :

xxxxxx TO DO xxxxxx

```bash
# base configuration running default configuration
helm install cluster-costs startx/cluster-costs
```

## Others values availables

- **startx** : costs operator (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-costs/values-startx.yaml))

```bash
helm install cluster-costs startx/cluster-costs -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-costs/values-startx.yaml
```

## History

| Release | Date       | Description                                                                   |
| ------- | ---------- | ----------------------------------------------------------------------------- |
| 15.27.9 | 2024-11-09 | Initialize the costs cluster-service chart (clonned from cluster-descheduler) |
| 15.27.17 | 2024-11-10 | Created the costs management chart based on release v3.3.1
| 15.27.19 | 2024-11-10 | Add the sxcollector support
| 15.27.21 | 2024-11-10 | Release aligned for OCP 4.15.37
| 16.19.3 | 2024-11-10 | Init release 16.19.1 aligned for OCP 4.16.19
| 16.19.7 | 2024-11-10 | Update all dependencies to version 16.19.4
| 16.19.11 | 2024-11-10 | Update all dependencies to version 16.19.4
| 16.19.15 | 2024-11-10 | publish stable update for the full repository
| 16.19.29 | 2024-11-11 | Align all chart to the 16.19.29 release

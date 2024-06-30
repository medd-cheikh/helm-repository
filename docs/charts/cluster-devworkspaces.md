# ![cluster-devworkspaces](https://helm-repository.readthedocs.io/en/latest/img/cluster-devworkspaces.svg "Cluster Chart : DevWorkspaces") Cluster Chart : DevWorkspaces
[![Artifacthub](https://img.shields.io/badge/ArtifactHub-STARTX_cluster--devworkspaces-8A2BE2.svg)](https://artifacthub.io/packages/search?ts_query_web=cluster+devworkspaces+startx)

This helm chart is used to deploy Dev Workspaces operator to help you develop your applications into kubernetes cluster.

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
helm show chart startx/cluster-devworkspaces
```

### 4. Install this chart

```bash
helm install cluster-devworkspaces startx/cluster-devworkspaces
```

## Default values

Complete deployment of a project with the following characteristics :

xxxxxx TO DO xxxxxx

```bash
# base configuration running default configuration
helm install cluster-devworkspaces startx/cluster-devworkspaces
```

## Others values availables

- **startx** : DevWorkspaces operator (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-devworkspaces/values-startx.yaml))

```bash
helm install cluster-devworkspaces startx/cluster-devworkspaces -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-devworkspaces/values-startx.yaml
```

## History

| Release  | Date       | Description                              |
| -------- | ---------- | ---------------------------------------- |
| 14.6.369 | 2025-06-30 | Initialize the cluster-devworkspaces structure inherited from cluster-mtr (inspired by cluster-workspace)  |
| 14.6.368 | 2024-06-30 | Create the cluster-devworkspaces structure inherited from cluster-mtr (inspired by cluster-workspace)

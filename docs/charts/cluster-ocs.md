# STARTX helm : cluster-ocs

This helm chart is used to configure Openshift Container Storage at the cluster level.
This chart is part of the cluster-xxx startx helm chart that doesn't create application deployment but rather represent a cluster configuration
state orchestrated by gitops tools like ArgoCD.

## Requirements and guidelines

Read the [startx helm-repository homepage](https://startxfr.github.io/helm-repository) for
more information on how to use theses resources.

## Deploy this helm chart on openshift

### Connect to your Openshift cluster

```bash
oc login -t <token> <cluster-url>
```

### Install the repository

```bash
helm repo add startx https://startxfr.github.io/helm-repository/packages/
```

### Get information about this chart

```bash
helm show chart startx/cluster-ocs
```

### Install this chart

```bash
helm install startx/cluster-ocs
```

## Default values

Complete deployment of a project with the following characteristics :

xxxx to do xxxxxx

```bash
# base configuration running default configuration
helm install startx/cluster-ocs
```

## Others values availables

- **startx** : Startx 3scale cluster wide service configuration using startx group (dev, devops and ops) (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-ocs/values-startx.yaml))

```bash
helm install startx/cluster-ocs -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-ocs/values-startx.yaml
```

## History

| Release | Date       | Description
| ------- | ---------- | -----------------------------------------------------
| 0.3.18  | 2020-11-06 | Create chart cluster-ocs from cluster-quay
| 0.3.19  | 2020-11-06 | Add deployment of an OCS cluster using StorageCluster ressource
| 0.3.19  | 2020-11-06 | Change the storageTemplate name and app name
| 0.3.21  | 2020-11-06 | Align all charts on the repository release 0.3.21
| 0.3.23  | 2020-11-07 | Add engineVersion to all chart (set to 4.5.12) and update all appVersion with the relevant information
| 0.3.29  | 2020-11-07 | Improve NOTES output and move to 0.3.25 dependencies
| 0.3.33  | 2020-11-07 | publish stable update for the full repository
| 0.3.35  | 2020-11-07 | Debug rbac role property
| 0.3.37  | 2020-11-07 | Improve helm hook ordering cordinated with dependencies

# STARTX helm : cluster-rbac

This helm chart is used to create a RBAC cluster configuration with group and user required as a default config fo the targeted cluster.
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
helm show chart startx/cluster-rbac
```

### Install this chart

```bash
helm install startx/cluster-rbac
```

## Default values

Complete deployment of a project with the following characteristics :

- 1 **group** named **mygroup_example** with the **basic-user** cluster role
- 1 **clusterRole** named **mygroup_example-basic-user** who gave the **basic-user** cluster role to all members of the **mygroup_example** group

```bash
# base configuration running default configuration
helm install startx/cluster-rbac
```

## Others values availables

- **startx** : Startx RBAC default context with dev, devops, ops and admin groups (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-rbac/values-startx.yaml))

```bash
helm install startx/cluster-rbac -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-rbac/values-startx.yaml
```

## History

| Release | Date       | Description
| ------- | ---------- | -----------------------------------------------------
| 0.0.1   | 2020-10-04 | Initial commit
| 0.1.22  | 2020-10-24 | add user support and update startx example value example
| 0.1.14   | 2020-10-24 | Improve documentation

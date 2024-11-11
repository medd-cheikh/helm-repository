# ![cluster-mongo](https://helm-repository.readthedocs.io/en/latest/img/cluster-mongo.svg "Cluster Chart : Mongo") Cluster Chart : Mongo
[![Artifacthub](https://img.shields.io/badge/ArtifactHub-STARTX_cluster--mongo-8A2BE2.svg)](https://artifacthub.io/packages/search?ts_query_web=cluster+mongo+startx)

This helm chart is used to deploy MongoDB instances managed by the official mongodb operator.

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
helm show chart startx/cluster-mongo
```

### 4. Install this chart

```bash
helm install cluster-mongo startx/cluster-mongo
```

## Deploy this helm chart with ArgoCD

### 1. Create the project

```bash
cat <<EOF | oc apply -f -
kind: Application
apiVersion: argoproj.io/v1alpha1
metadata:
name: mongo-project
namespace: "openshift-gitops"
spec:
  destination:
    namespace: "mongo-demo"
    server: 'https://kubernetes.default.svc'
project: default
source:
    path: charts/cluster-mongo/
    repoURL: 'https://github.com/startxfr/helm-repository.git'
    targetRevision: "stable"
    helm:
    valueFiles:
    - values-demo.yaml
    parameters:
    - name: project.enabled
      value: "true"
EOF
```

## 2. Deploy the operator

```bash
cat <<EOF | oc apply -f -
kind: Application
apiVersion: argoproj.io/v1alpha1
metadata:
name: mongo-operator
namespace: "openshift-gitops"
spec:
  destination:
    namespace: "openshift-operators"
    server: 'https://kubernetes.default.svc'
project: default
source:
    path: charts/cluster-mongo/
    repoURL: 'https://github.com/startxfr/helm-repository.git'
    targetRevision: "stable"
    helm:
    valueFiles:
    - values-demo.yaml
    parameters:
    - name: operator.enabled
      value: "true"
EOF
```

## 2. Deploy a mongo instance

```bash
cat <<EOF | oc apply -f -
kind: Application
apiVersion: argoproj.io/v1alpha1
metadata:
name: mongo-instance
namespace: "openshift-gitops"
spec:
  destination:
    namespace: "mongo-demo"
    server: 'https://kubernetes.default.svc'
project: default
source:
    path: charts/cluster-mongo/
    repoURL: 'https://github.com/startxfr/helm-repository.git'
    targetRevision: "stable"
    helm:
    valueFiles:
    - values-demo.yaml
    parameters:
    - name: cluster.enabled
      value: "true"
    - name: loader.enabled
      value: "true"
EOF
```

## Default values

Complete deployment of a project with the following characteristics :

xxxxxx TO DO xxxxxx

```bash
# base configuration running default configuration
helm install cluster-mongo startx/cluster-mongo
```

## Others values availables

- **startx** : MongoDB operator (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-mongo/values-startx.yaml))

```bash
helm install cluster-mongo startx/cluster-mongo -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-mongo/values-startx.yaml
```

## History

| Release  | Date       | Description                                    |
| -------- | ---------- | ---------------------------------------------- |
| 16.19.15 | 2024-11-10 | Init cluster-mongo skeleton from cluster-mongo |
| 16.19.17 | 2024-11-11 | Implement the MongoDB CRD and mongo loader

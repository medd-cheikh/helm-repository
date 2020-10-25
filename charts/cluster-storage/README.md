# STARTX helm : cluster-storage

This helm chart is used to create a list of storageClass available for the cluster.
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
helm show chart startx/cluster-storage
```

### Install this chart

```bash
helm install startx/cluster-storage
```

## Default values

Deployment of storage classes :

- 1 **storageClass** named **example-gp2** with the following characteristics
  - **provisioner** set to **kubernetes.io/aws-ebs**
  - provisioner **encryption** specific parameters set to **true**
  - storage class **reclaim policy** set to **Delete**
  - storage class **volume expansion enabled**
  - storage class **volume binding mode** set to **WaitForFirstConsumer**

```bash
# base configuration running default configuration
helm install startx/cluster-storage
```

## Others values availables

- **startx** : Startx storage classes running under AWS infrastructure (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-storage/values-startx.yaml)) creating the following storage classes
  - **aws-generic-retain** (AWS EBS gp2 level with encryption and expansion enabled with retain policy)
  - **aws-generic-delete** (AWS EBS gp2 level with encryption and expansion enabled with delete policy)
  - **aws-fast-retain** (AWS EBS io1 level without encryption and expansion enabled with retain policy)
  - **aws-fast-delete** (AWS EBS io1 level without encryption and expansion enabled with delete policy)
  - **aws-slow-retain** (AWS EBS sc1 level with encryption and expansion enabled with retain policy)
  - **aws-slow-delete** (AWS EBS sc1 level with encryption and expansion enabled with delete policy)

```bash
helm install startx/cluster-storage -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-storage/values-startx.yaml
```

- **startx-ocs** : Startx storage classes for OCS infrastructure (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-storage/values-startx-ocs.yaml)) creating the following storage classes
  - **ocs-generic-retain** (OCS provisionned via openshift-storage.rbd.csi.ceph.com in cluster openshift-storage with retain policy and expansion enabled)
  - **ocs-generic-delete** (OCS provisionned via openshift-storage.rbd.csi.ceph.com in cluster openshift-storage with delete policy and expansion enabled)
  - **ocs-fs-retain** (OCS provisionned via openshift-storage.cephfs.csi.ceph.com in cluster openshift-storage with retain policy)
  - **ocs-fs-delete** (OCS provisionned via openshift-storage.cephfs.csi.ceph.com in cluster openshift-storage with delete policy)

```bash
helm install startx/cluster-storage -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-storage/values-startx-ocs.yaml
```

## History

| Release | Date       | Description
| ------- | ---------- | -----------------------------------------------------
| 0.0.1   | 2020-10-01 | Initial commit
| 0.1.0   | 2020-10-07 | Release 0.1 stable release for all charts
| 0.1.14  | 2020-10-23 | Improve documentation
| 0.2.0   | 2020-10-24 | Stable startx helm base config
| 0.2.1   | 2020-10-24 | publish stable update for the full repository
| 0.2.2   | 2020-10-24 | Repository update with all chart release
| 0.2.5   | 2020-10-24 | Unstable repository global update
| 0.2.7   | 2020-10-24 | Unstable repository release
| 0.2.9   | 2020-10-24 | Update demo charts
| 0.3.0  | 2020-10-25 | Improve cluster-storage options

# STARTX helm : cluster-machine

This helm chart is used to configure the Machine api of your cluster.
This chart is part of the cluster-xxx startx helm chart that doesn't create application deployment but rather represent a cluster configuration state orchestrated by gitops tools like ArgoCD.

## Requirements and guidelines

Read the [startx helm-repository homepage](https://startxfr.github.io/helm-repository) for
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
helm show chart startx/cluster-machine
```

### 4. Install this chart

```bash
helm install startx/cluster-machine
```

## Default values

Deployment of machine classes :

<!-- - 1 **machineSet** named **example-gp2** with the following characteristics
  - **provisioner** set to **kubernetes.io/aws-ebs**
  - provisioner **encryption** specific parameters set to **true**
  - machine class **reclaim policy** set to **Delete**
  - machine class **volume expansion enabled**
  - machine class **volume binding mode** set to **WaitForFirstConsumer** -->

```bash
# base configuration running default configuration
helm install startx/cluster-machine
```

## Others values availables

<!-- - **startx** : Startx machine classes running under AWS infrastructure (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-machine/values-startx.yaml)) creating the following machine classes
  - **aws-generic-retain** (AWS EBS gp2 level with encryption and expansion enabled with retain policy)
  - **aws-generic-delete** (AWS EBS gp2 level with encryption and expansion enabled with delete policy)
  - **aws-fast-retain** (AWS EBS io1 level without encryption and expansion enabled with retain policy)
  - **aws-fast-delete** (AWS EBS io1 level without encryption and expansion enabled with delete policy)
  - **aws-slow-retain** (AWS EBS sc1 level with encryption and expansion enabled with retain policy)
  - **aws-slow-delete** (AWS EBS sc1 level with encryption and expansion enabled with delete policy)

```bash
helm install startx/cluster-machine -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-machine/values-startx.yaml
```

- **startx-ocs** : Startx machine classes for OCS infrastructure (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-machine/values-startx-ocs.yaml)) creating the following machine classes
  - **ocs-generic-retain** (OCS provisionned via openshift-machine.rbd.csi.ceph.com in cluster openshift-machine with retain policy and expansion enabled)
  - **ocs-generic-delete** (OCS provisionned via openshift-machine.rbd.csi.ceph.com in cluster openshift-machine with delete policy and expansion enabled)
  - **ocs-fs-retain** (OCS provisionned via openshift-machine.cephfs.csi.ceph.com in cluster openshift-machine with retain policy)
  - **ocs-fs-delete** (OCS provisionned via openshift-machine.cephfs.csi.ceph.com in cluster openshift-machine with delete policy)

```bash
helm install startx/cluster-machine -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-machine/values-startx-ocs.yaml
``` -->

## History

| Release | Date       | Description                                                                                            |
| ------- | ---------- | ------------------------------------------------------------------------------------------------------ |
| 0.3.191 | 2021-02-20 | Create chart cluster-machine from cluster-machine
| 0.3.199 | 2021-02-20 | prepare alpha release of 0.4 and update dependencies charts
| 0.3.201 | 2021-02-20 | Update icon and image for charts
| 0.3.203 | 2021-02-21 | Upgrade chart release informations

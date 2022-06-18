# Cluster Ansible

This helm chart is used to create an operator based deployment of Ansible Automation.
This chart is part of the [cluster-xxx startx helm chart series](https://helm-repository.readthedocs.io#cluster-helm-charts) that doesn't necessarily deployment pod but rather represent a cluster configuration state orchestrated by gitops tools like ArgoCD.

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
helm repo add startx https://startxfr.github.io/helm-repository/packages/
```

### 3. Get information about this chart

```bash
helm show chart startx/cluster-ansible
```

### 4. Install this chart

```bash
helm install startx/cluster-ansible
```

## Default values

Complete deployment of a project with the following characteristics :

- 1 **project:** named **ansible-automation-platform** with the following properties
- 1 **operator:** named **ansible-automation-platform-operator** configured with
  - The **early-access-cluster-scoped** channel
  - The **2.1.0** version
  - Deployed under the **ansible-automation-platform** project
  - The **ansible** deployed
- 1 **ansibleHub:** enabled

```bash
# base configuration running default configuration
helm install startx/cluster-ansible
```

## Others values availables

- **startx** : Startx ansible cluster wide service configuration using startx group (dev, devops and ops) (see [values.yaml](https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-ansible/values-startx.yaml))

```bash
helm install startx/cluster-ansible -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/cluster-ansible/values-startx.yaml
```

## History

| Release | Date       | Description                                                                                 |
| ------- | ---------- | ------------------------------------------------------------------------------------------- |
| 9.8.19  | 2021-11-20 | Create chart cluster-ansible from cluster-quay                                              |
| 9.8.21  | 2021-11-20 | Initial version of the cluster chart for ansible                                            |
| 9.8.28  | 2021-11-20 | Update the startx chart dependencies to version 9.8.23                                      |
| 9.8.39  | 2021-11-21 | Debug version check with more permissive mode                                               |
| 9.8.43  | 2021-11-21 | Update the startx chart dependencies to version 9.8.39                                      |
| 9.8.45  | 2021-11-21 | Update the values schema limits for context properties                                      |
| 9.8.47  | 2021-11-21 | Improve version management for chart                                                        |
| 9.8.51  | 2021-11-22 | Update startx chart dependencies to version 9.8.48                                          |
| 9.8.52  | 2021-11-22 | Update to ansible-automation-platform operator version and move to a cluster scope operator |
| 9.8.53  | 2021-12-09 | Update to ansible-automation-platform operator version v2.1.0-0.1638388448                  |
| 9.8.67  | 2021-12-18 | Align all charts to release 9.8.67                                                          |
| 9.8.71  | 2021-12-18 | Update helm-chart dependencies to version 9.8.59                                            |
| 9.8.75  | 2021-12-19 | Align with all other startx chart version to number 9.8.75                                  |
| 9.8.76  | 2021-12-19 | Change helm.sh/chart name                                                                   |
| 9.8.81  | 2021-12-20 | Update the storage context                                                                  |
| 9.8.91  | 2022-03-06 | publish stable update for the full repository                                               |
| 9.8.93  | 2022-03-07 | Enable conditionnal loading of charts dependencies                                          |
| 9.8.94  | 2022-04-21 | Update to ansible automation operator version 2.1.2-0.1650395354                            |
| 9.8.109 | 2022-04-26 | Update startx chart dependencies to version 9.8.107                                         |
| 9.8.109 | 2022-04-26 | Update startx chart dependencies to version 9.8.107                                         |
| 9.8.110 | 2022-04-27 | Stable release for all charts                                                               |
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
| 10.12.41 | 2022-06-18 | Align all charts to version 10.12.41

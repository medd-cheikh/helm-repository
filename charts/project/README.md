# Basic project

This helm chart is used to create a project, or namespace, with various options constraint resources like networkPolicy, RoleBinding, LimitRange and Quotas.

This chart is part of the [basic-xxx startx helm chart series](https://helm-repository.readthedocs.io#basic-helm-charts) used by [cluster-xxx charts](https://helm-repository.readthedocs.io#cluster-helm-charts) and [example-xxx charts](https://helm-repository.readthedocs.io#examples-helm-charts).

## Requirements and guidelines

Read the [startx helm-repository homepage](https://helm-repository.readthedocs.io)  for
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
helm show chart startx/project
```

### 4. Install this chart

```bash
helm install startx/project
```

## Values dictionary

### context values dictionary

| Key                 | Default   | Description                                                                       |
| ------------------- | --------- | --------------------------------------------------------------------------------- |
| context.scope       | default   | Name of the global scope for this application (organisational tenant)             |
| context.cluster     | localhost | Name of the cluster running this application (plateform tenant)                   |
| context.environment | dev       | Name of the environement for this application (ex: dev, factory, preprod or prod) |
| context.component   | demo      | Component name of this application (logical tenant)                               |
| context.app         | project   | Application name (functionnal tenant, default use Chart name)                     |
| context.version     | 0.0.1     | Version name of this application (default use Chart appVersion)                   |

### project values dictionary

| Key                         | Default         | Description                                                |
| --------------------------- | --------------- | ---------------------------------------------------------- |
| project.type                | project         | Define the type of tenant to create (project or namespace) |
| project.name                | default         | Name of the project                                        |
| project.display_name        | default         | Display name of the project (only for project)             |
| project.description         | default         | Description of the project (only for project)              |
| rbac.enabled                | false           | Enable RBAC default for this project                       |
| rbac.groups[]               | []              | List groups to authorize on this project                   |
| rbac.groups[0].id           | mygroup         | Group ID for roleBinding                                   |
| rbac.groups[0].name         | mygroup_example | Group name for roleBinding                                 |
| rbac.groups[0].role         | view            | Role to use for this group roleBinding                     |
| rbac.users[]                | []              | List groups to authorize on this project                   |
| rbac.users[0].id            | myuser          | User ID for roleBinding                                    |
| rbac.users[0].name          | myuser_example  | User name for roleBinding                                  |
| rbac.users[0].role          | view            | Role to use for this user roleBinding                      |
| networkpolicy.enabled       | false           | Enable NetworkPolicy default for this project              |
| networkpolicy.rules[]       | []              | List group to create                                       |
| networkpolicy.rules[0].id   | string          | Rule ID for the networkPolicy                              |
| networkpolicy.rules[0].spec | string          | Specifications of this policy rule                         |
| limits.enabled              | false           | Enable limitRange for this project                         |
| limits.rules                | string          | Specifications of the limitRange ressource                 |
| quotas.enabled              | false           | Enable quotas for this project                             |
| quotas.rules                | string          | Specifications of the quotas ressource                     |

## Values files

### Default values file (values.yaml)

Complete deployment of a project with the following characteristics :

- 1 **project** named **example-project**

```bash
# base configuration running default configuration
helm install startx/project
```

### Demo kustomize values file (values-demo-kustomize.yaml)

Complete deployment of a demo kustomize project with the following characteristics :

- 1 **project** named **demo-kustomize**
- 4 **RBAC** rules enabled
  - 1 **group RBAC** named **dev** binding group **dev** to role **view**
  - 1 **group RBAC** named **devops** binding group **devops** to role **edit**
  - 1 **group RBAC** named **ops** binding group **ops** to role **admin**
  - 1 **user RBAC** named **argocd-controller-sa** binding user **sa argocd-application-controller** to role **edit**
- 1 **networkpolicy** rules disabled
- 1 **limitRange** rules enabled
- 1 **quotas** rules enabled

```bash
# base configuration running demo kustomize configuration
helm install startx/project -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/project/values-demo-kustomize.yaml
```

### Demo helm values file (values-demo-helm.yaml)

Complete deployment of a demo helm project with the following characteristics :

- 1 **project** named **demo-helm**
- 4 **RBAC** rules enabled
  - 1 **group RBAC** named **dev** binding group **dev** to role **basic-user**
  - 1 **group RBAC** named **devops** binding group **devops** to role **edit**
  - 1 **group RBAC** named **ops** binding group **ops** to role **admin**
  - 1 **user RBAC** named **argocd-controller-sa** binding user **sa argocd-application-controller** to role **edit**
- 2 **networkpolicy** rules enabled
  - 1 networkpolicy named **allow-from-openshift-ingress**
  - 1 networkpolicy named **allow-from-same-namespace**
- 1 **limitRange** rules enabled
- 1 **quotas** rules enabled

```bash
# base configuration running demo helm configuration
helm install startx/project -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/project/values-demo-helm.yaml
```

### Demo argocd values file (values-demo-argocd.yaml)

Complete deployment of a demo argocd project with the following characteristics :

- 1 **project** named **demo-argocd**
- 4 **RBAC** rules enabled
  - 1 **group RBAC** named **dev** binding group **dev** to role **view**
  - 1 **group RBAC** named **devops** binding group **devops** to role **edit**
  - 1 **group RBAC** named **ops** binding group **ops** to role **admin**
  - 1 **user RBAC** named **argocd-controller-sa** binding user **sa argocd-application-controller** to role **edit**
- 2 **networkpolicy** rules disabled
- 1 **limitRange** rules enabled
- 1 **quotas** rules enabled

```bash
# base configuration running demo argocd configuration
helm install startx/project -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/project/values-demo-argocd.yaml
```

### Demo example values file (values-demo-example.yaml)

Complete deployment of a demo example project with the following characteristics :

- 1 **namespace** named **example-project**
- 2 **RBAC** rules enabled
  - 1 **group RBAC** named **mygroup** binding group **mygroup_example** to role **basic-user**
  - 1 **user RBAC** named **myuser** binding user **myuser_example** to role **basic-user**
- 2 **networkpolicy** rules enabled
  - 1 networkpolicy named **allow-from-openshift-ingress**
  - 1 networkpolicy named **allow-from-same-namespace**
- 1 **limitRange** rules enabled
- 1 **quotas** rules enabled

```bash
# base configuration running demo example configuration
helm install startx/project -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/project/values-demo-example.yaml
```

### Startx values file (values-startx.yaml)

Complete deployment of a startx project with the following characteristics :

- 1 **project** named **startx-project**
- 4 **RBAC** rules enabled
  - 1 **group RBAC** named **dev** binding group **dev** to role **basic-user**
  - 1 **group RBAC** named **devops** binding group **devops** to role **edit**
  - 1 **group RBAC** named **ops** binding group **ops** to role **admin**
  - 1 **user RBAC** named **dev** binding user **dev** to role **basic-user**
- 2 **networkpolicy** rules enabled
  - 1 networkpolicy named **allow-from-openshift-ingress**
  - 1 networkpolicy named **allow-from-same-namespace**
- 1 **limitRange** rules enabled
- 1 **quotas** rules enabled

```bash
# base configuration running startx configuration
helm install startx/project -f https://raw.githubusercontent.com/startxfr/helm-repository/master/charts/project/values-startx.yaml
```

## History

| Release | Date       | Description                                                                                            |
| ------- | ---------- | ------------------------------------------------------------------------------------------------------ |
| 0.2.51  | 2020-10-31 | Initial commit for this chart with default and dev value examples                                      |
| 0.3.0   | 2020-10-31 | Stable 0.3 release                                                                                     |
| 0.3.1   | 2020-11-01 | Move to go templates for notes generation and move app content to value property project.data          |
| 0.3.3   | 2020-11-01 | Test new scope for note template helper                                                                |
| 0.3.21  | 2020-11-06 | Align all charts on the repository release 0.3.21                                                      |
| 0.3.23  | 2020-11-07 | Add engineVersion to all chart (set to 4.5.12) and update all appVersion with the relevant information |
| 0.3.45  | 2020-11-08 | Align all basic helm chart to 0.3.45 release                                                           |
| 0.3.65  | 2020-11-09 | Add hooked option to enable/disable use of helm hook (default is disabled)                             |
| 0.3.81  | 2020-11-10 | Improve project options                                                                                |
| 0.3.91  | 2020-11-10 | Add enable option to enable the creation of a project (default false)                                  |
| 0.3.95  | 2020-11-11 | networkPolicy and roleBinding update                                                                   |
| 0.3.115 | 2020-11-12 | Release basic chart stability updates                                                                  |
| 0.3.119 | 2020-11-14 | Add demo values for hpa, affinity and istio                                                            |
| 0.3.131 | 2020-11-14 | Stable values examples                                                                                 |
| 0.3.135 | 2020-11-23 | Improve documentation for all examples charts                                                          |
| 0.3.141 | 2020-11-24 | publish stable update for the full repository                                                          |
| 0.3.142 | 2021-01-23 | Update for OCP 4.6.13                                                                                  |
| 0.3.151 | 2021-01-23 | Upgrade chart to OCP version 4.3.13                                                                    |
| 0.3.153 | 2021-01-23 | publish stable update for the full repository                                                          |
| 0.3.155 | 2021-01-23 | Debug requester creation                                                                               |
| 0.3.155 | 2021-01-23 | Debug requester creation                                                                               |
| 0.3.165 | 2021-01-23 | Upgrade all chart dependencies                                                                         |
| 0.3.167 | 2021-01-24 | Remove conditional dependencies for argocd compatibility in HA environments                            |
| 0.3.169 | 2021-01-24 | Move to 0.3.155 dependencies                                                                           |
| 0.3.171 | 2021-01-24 | Reduce argocd wave level                                                                               |
| 0.3.187 | 2021-02-13 | Align basic chart release to 0.3.187                                                                   |
| 0.3.189 | 2021-02-13 | remove manpage                                                                                         |
| 0.3.189 | 2021-02-13 | Align all basic charts to 0.3.189                                                                      |
| 0.3.191 | 2021-02-13 | Update cluster chart dependencies to 0.3.189                                                           |
| 0.3.193 | 2021-02-20 | Stable base helm-chart                                                                                 |
| 0.3.199 | 2021-02-20 | prepare alpha release of 0.4 and update dependencies charts                                            |
| 0.3.201 | 2021-02-20 | Update icon and image for charts                                                                       |
| 0.3.203 | 2021-02-21 | Upgrade chart release informations                                                                     |
| 0.3.205 | 2021-04-19 | Align release of core charts                                                                           |
| 0.3.207 | 2021-04-19 | Core chart dependencies moved to v0.3.205                                                              |
| 0.3.209 | 2021-05-06 | Prepare upgrade to 4.7 and add template for AFD                                                        |
| 0.3.215 | 2021-05-06 | Align all chart to release 0.3.215                                                                     |
| 0.3.217 | 2021-05-10 | Move RBAC naming to unique id                                                                          |
| 0.3.217 | 2021-05-10 | Move RBAC naming to unique id                                                                          |
| 0.3.225 | 2021-05-10 | Update all chart to use new RBAC naming                                                                |
| 0.3.226 | 2021-05-31 | Add values files for various demo                                                                      |
| 0.3.227 | 2021-05-31 | Add demo compliance values                                                                             |
| 0.3.305 | 2021-06-04 | publish stable update for the full repository                                                          |
| 0.3.343 | 2021-06-06 | publish stable update for the full repository                                                          |
| 0.3.381 | 2021-06-10 | Align example and cluster charts dependencies to basic chart version 0.3.377                           |
| 0.3.390 | 2021-06-12 | Prepare 0.4.0 release
| 0.3.423 | 2021-06-17 | Prepare the v0.4 release. Stable aligned version of all charts
| 0.3.431 | 2021-07-05 | Move to dependencies 1.18.0
| 0.3.480 | 2021-08-03 | publish stable update for the full repository
| 0.3.998 | 2021-08-04 | publish stable update for the full repository
| 0.3.999 | 2021-08-04 | Release stable version 0.3.999 align with ocp 4.7.13
| 7.22.1 | 2021-08-04 | Move to release 7.22.1 to align versionning with ocp release cycle
| 7.22.2 | 2021-08-04 | Move helm dependencies to a 7.x.x release model
| 7.22.3 | 2021-08-05 | publish stable update for the full repository
| 7.22.5 | 2021-08-05 | publish stable update for the full repository
| 7.22.6 | 2021-08-05 | Stable version for chart dependencies
| 7.22.7 | 2021-08-05 | Stable for OCP version 4.7.22
| 7.22.12 | 2021-09-23 | publish stable update for the full repository
| 7.22.15 | 2021-10-05 | Add support for ServicdAccount and ImagePullSecret management
| 7.22.21 | 2021-10-05 | ServiceAccount and ImagePullSecrets managed by project chart
| 7.22.23 | 2021-10-06 | Debug the imagePullSecret namespace
| 7.22.25 | 2021-10-06 | publish stable update for the full repository
| 7.22.27 | 2021-10-06 | publish stable update for the full repository
| 8.13.1 | 2021-10-06 | Stable release for OCP 4.8.13 version
| 8.13.3 | 2021-10-08 | Improve code execution, syntax and introduce the ACS helm-chart
| 8.13.5 | 2021-10-21 | publish stable update for the full repository
| 8.13.7 | 2021-10-21 | publish stable update for the full repository
| 8.13.8 | 2021-10-21 | Adding first draft of json schema
| 8.13.9 | 2021-10-22 | Adding the schema in chart
| 8.13.15 | 2021-10-31 | Improve schema[1;5Djson
| 8.13.16 | 2021-10-31 | Improve schema with all features
| 8.13.17 | 2021-10-31 | Improve schema with support for all options
| 8.13.18 | 2021-10-31 | Remove conditional subchart in schema (imcompatible with Openshift console)
| 8.13.19 | 2021-10-31 | value.schema.json fully support all options
| 8.13.21 | 2021-11-01 | Align basic charts to version 8.13.21
| 8.13.23 | 2021-11-10 | Solve helm issue in the kubeVersion for kube clusters and push up limits in values.schema.json
| 8.13.25 | 2021-11-10 | Solve helm issue in the kubeVersion for kube clusters and upgrade chart dep to version 8.13.23
| 8.13.27 | 2021-11-10 | publish stable update for the full repository
| 8.20.3 | 2021-11-11 | Align all charts to Openshift version 4.8.20
| 8.20.2 | 2021-11-11 | stable release for basic chart for Openshift version 4.8.20
| 8.20.5 | 2021-11-12 | Upgrade all appVersion and align chart release
| 8.20.9 | 2021-11-12 | Align all startx chart to version 8.20.9
| 0.20.11 | 2021-11-12 | Move chart dependencies to version 8.20.5
| 0.20.33 | 2021-11-14 | publish stable update for the full repository
| 0.20.34 | 2021-11-14 | Stable for basic chart
| 0.20.41 | 2021-11-14 | Aling all dependencies to version 0.20.34
| 8.20.45 | 2021-11-19 | Stable version for project chart
| 8.20.46 | 2021-11-19 | Transitionnal chart
| 8.20.55 | 2021-11-19 | Stable release for basic charts
| 8.20.60 | 2021-11-19 | publish stable update for the full repository
| 8.20.63 | 2021-11-20 | Updating values schema
| 8.20.66 | 2021-11-20 | Updating limits for context vars in values schema
| 8.20.70 | 2021-11-20 | publish stable update for the full repository
| 8.20.71 | 2021-11-20 | Align all charts to Openshift version 4.8.21
| 9.8.1 | 2021-11-20 | Upgrade to Openshift version 4.9.8
| 9.8.4 | 2021-11-20 | Stable release of chart for Openshift 4.9.8 version
| 9.8.7 | 2021-11-20 | Debug dependencies problem
| 9.8.8 | 2021-11-20 | Update schema limit to 30 characters for version name

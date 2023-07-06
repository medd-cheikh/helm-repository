# Example Fruitapp -project

This helm chart is used to deploy all project required to deploy a full CI/CD chain for the fruitapp demo application.

This chart is part of the [example-fruitapp-xxx startx helm chart series](https://helm-repository.readthedocs.io#examples-helm-charts) focused on deploying various kind of application consuming the cluster services deployed using the [cluster-xxx charts](https://helm-repository.readthedocs.io#cluster-helm-charts).

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
helm repo add startx https://helm-repository.readthedocs.io/en/latest/packages/
```

### 3. Get information about this chart

```bash
helm show chart startx/example-fruitapp-project
```

### 4. Install this chart

```bash
helm install example-fruitapp-project startx/example-fruitapp-project
```

## Values dictionary

### context values dictionary

| Key                 | Default   | Description                                                                       |
| ------------------- | --------- | --------------------------------------------------------------------------------- |
| context.scope       | default   | Name of the global scope for this application (organisational tenant)             |
| context.cluster     | localhost | Name of the cluster running this application (plateform tenant)                   |
| context.environment | dev       | Name of the environement for this application (ex: dev, factory, preprod or prod) |
| context.component   | demo      | Component name of this application (logical tenant)                               |
| context.app         | sxapi     | Application name (functionnal tenant, default use Chart name)                     |
| context.version     | 0.0.1     | Version name of this application (default use Chart appVersion)                   |

### example-fruitapp-project values dictionary

| Key                 | Default | Description                                                                                                    |
| ------------------- | ------- | -------------------------------------------------------------------------------------------------------------- |
| project_devel       | {}      | See [project chart](https://helm-repository.readthedocs.io/en/latest/charts/project)                           |
| project_integration | {}      | See [project chart](https://helm-repository.readthedocs.io/en/latest/charts/project)                           |
| project_preprod     | {}      | See [project chart](https://helm-repository.readthedocs.io/en/latest/charts/project)                           |
| project_prod        | {}      | See [project chart](https://helm-repository.readthedocs.io/en/latest/charts/project)                           |
| imagestreams        | {}      | See [example-imagestreams chart](https://helm-repository.readthedocs.io/en/latest/charts/example-imagestreams) |

## Values files

### Default values file (values.yaml)

Deploy the full fruitapp CI/CD context with the following characteristics :

- 1 **project** named **fruitapp-devel-christophe**
- 1 **project** named **fruitapp-ci**
- 1 **project** named **fruitapp-preprod**
  - 1 **roleBinding** allowing **fruitapp-ci pipeline** to push image
  - 1 **imageStream** named **frontend** holding deployed images
- 1 **project** named **fruitapp-prod**
  - 1 **roleBinding** allowing **fruitapp-ci pipeline** to push image
  - 1 **imageStream** named **frontend** holding deployed images

```bash
# base configuration running default configuration
helm install example-fruitapp-project startx/example-fruitapp-project
```

## History

| Release  | Date       | Description                                                      |
| -------- | ---------- | ---------------------------------------------------------------- |
| 9.8.239  | 2022-05-28 | Initial commit for this helm chart with default value example    |
| 9.8.240  | 2022-05-29 | Improve the schema                                               |
| 9.8.253  | 2022-05-29 | Align all charts dependencies to release 9.8.251                 |
| 9.8.254  | 2022-05-29 | Add support for the devel deployment                             |
| 9.8.255  | 2022-05-29 | Debug the db deployment                                          |
| 9.8.277  | 2022-05-31 | publish stable update for the full repository                    |
| 9.15.1   | 2022-06-01 | Align all chart for Openshift 4.9.15                             |
| 9.15.2   | 2022-06-01 | Align all charts to release 9.15.1                               |
| 9.15.3   | 2022-06-01 | Align all charts to release 9.15.3                               |
| 10.12.1  | 2022-06-01 | Align all charts to release 10.12.1                              |
| 10.12.3  | 2022-06-01 | publish stable update for the full repository                    |
| 10.12.4  | 2022-06-01 | Align all charts to release 10.12.4                              |
| 10.12.5  | 2022-06-01 | publish stable update for the full repository                    |
| 10.12.22 | 2022-06-04 | Align all chart to release version 10.12.22                      |
| 10.12.23 | 2022-06-04 | Basi chart dependencies upgraded to version 10.12.5              |
| 10.12.29 | 2022-06-17 | publish stable update for the full repository                    |
| 10.12.30 | 2022-06-17 | Improved logo and global documentation                           |
| 10.12.33 | 2022-06-17 | publish stable update for the full repository                    |
| 10.12.34 | 2022-06-17 | Align all dependencies charts to 10.12.31                        |
| 10.12.41 | 2022-06-18 | Align all charts to version 10.12.41                             |
| 10.12.46 | 2022-06-18 | publish stable update for the full repository                    |
| 10.12.49 | 2022-06-18 | publish stable update for the full repository                    |
| 10.12.53 | 2022-06-18 | publish stable update for the full repository                    |
| 10.12.71 | 2022-06-28 | Debug the appVersion in all charts                               |
| 10.12.72 | 2022-07-02 | Common release                                                   |
| 10.12.77 | 2022-07-02 | Stable for clients                                               |
| 10.12.81 | 2022-07-02 | publish stable update for the full repository                    |
| 10.12.97 | 2022-07-03 | publish stable update for the full repository                    |
| 10.12.99 | 2022-09-16 | Initialize OCP 4.11 upgrade on all chart                         |
| 11.5.3   | 2022-09-17 | Align all STARTX charts to release 11.5.3                        |
| 11.7.1   | 2022-10-01 | Upgrade chart to latest release available for OCP 4.11.7 release |
| 11.7.3   | 2022-10-02 | publish stable update for the full repository                    |
| 11.7.9   | 2022-10-02 | publish stable update for the full repository                    |
| 11.7.10 | 2022-10-02 | Stable release for all packages
| 11.7.11 | 2022-10-02 | publish stable update for the full repository
| 11.7.15 | 2022-10-02 | publish stable update for the full repository
| 11.7.17 | 2022-10-02 | publish stable update for the full repository
| 11.7.31 | 2022-10-29 | publish stable update for the full repository
| 11.7.33 | 2022-10-29 | Update all startx packages to release 11.7.33
| 11.7.41 | 2022-11-02 | publish stable update for the full repository
| 11.7.61 | 2022-11-30 | publish stable update for the full repository
| 11.7.62 | 2022-11-30 | Debug console links and notifications
| 11.7.63 | 2022-11-30 | publish stable update for the full repository
| 11.7.67 | 2022-11-30 | Debug depedencies on sub charts
| 11.7.69 | 2022-11-30 | Finished dependencies stabilization
| 11.7.73 | 2022-12-04 | Align all packages to release 11.7.73
| 11.7.75 | 2022-12-04 | publish stable update for the full repository
| 11.7.77 | 2022-12-05 | publish stable update for the full repository
| 11.7.87 | 2023-02-15 | publish stable update for the full repository
| 11.7.88 | 2023-02-15 | publish stable update for the full repository
| 11.7.91 | 2023-02-16 | publish stable update for the full repository
| 11.7.93 | 2023-02-16 | align dependencies to version 11.7.89
| 11.7.97 | 2023-02-19 | publish stable update for the full repository
| 11.28.11 | 2023-02-19 | publish stable update for the full repository
| 11.28.15 | 2023-02-19 | publish stable update for the full repository
| 11.28.16 | 2023-02-19 | publish stable update for the full repository
| 11.28.19 | 2023-02-19 | publish stable update for the full repository
| 11.28.21 | 2023-02-19 | Upgrade all dependencies packages to release 11.28.15
| 11.28.23 | 2023-02-21 | publish stable update for the full repository
| 11.28.27 | 2023-02-21 | All chart aligned to release 11.28.27
| 11.28.29 | 2023-02-21 | publish stable update for the full repository
| 11.28.35 | 2023-02-21 | publish stable update for the full repository
| 11.28.37 | 2023-02-21 | Improve example-fruitapp-project options
| 11.28.49 | 2023-02-21 | publish stable update for the full repository
| 11.28.51 | 2023-02-21 | add activated flag for dependencies
| 11.28.52 | 2023-02-21 | Improve example-fruitapp-project options
| 11.28.53 | 2023-02-21 | Improve example-fruitapp-project options
| 11.28.59 | 2023-02-21 | publish stable update for the full repository
| 11.28.60 | 2023-02-21 | publish stable update for the full repository
| 11.28.67 | 2023-02-23 | publish stable update for the full repository
| 11.28.69 | 2023-03-07 | publish stable update for the full repository
| 11.28.89 | 2023-04-01 | publish stable update for the full repository
| 11.28.93 | 2023-04-20 | publish stable update for the full repository
| 11.28.95 | 2023-04-21 | publish stable update for the full repository
| 11.28.99 | 2023-04-21 | publish stable update for the full repository
| 11.28.103 | 2023-05-04 | publish stable update for the full repository
| 11.28.127 | 2023-06-12 | publish stable update for the full repository
| 11.28.128 | 2023-06-12 | publish stable update for the full repository
| 11.28.129 | 2023-06-13 | publish stable update for the full repository
| 11.28.201 | 2023-07-06 | publish stable update for the full repository

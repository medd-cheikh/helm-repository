# Example Fruitapp -app

This helm chart is used to deploy the fruitapp application into a namespace created using the
`example-fruitapp-project` helm chart. Furthemore, your project should have a runing database and
related shared services as the one deployed with `example-fruitapp-shared` helm chart.

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
helm repo add startx https://startxfr.github.io/helm-repository/packages/
```

### 3. Get information about this chart

```bash
helm show chart startx/example-fruitapp-app
```

### 4. Install this chart

```bash
helm install startx/example-fruitapp-app
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

### example-fruitapp-app values dictionary

| Key                   | Default          | Description                                                                                 |
| --------------------- | ---------------- | ------------------------------------------------------------------------------------------- |
| namespace             | fruitapp-preprod | Project used fot theses resources                                                           |
| frontend              | {}               | Configuration of the frontend components                                                    |
| frontend.enabled      | true             | Enable frontend for this project                                                            |
| frontend.name         | fruitapp         | Microservice name used                                                                      |
| frontend.memory_limit | 128Mi            | Microservice memory limit                                                                   |
| frontend.replicas     | 2                | The number of replicas to apply                                                             |
| frontend.version      | v3.2.11          | The appication version (should be one of latest, v3.2.8, v3.2.11 or any existing image tag) |

## Values files

### Default values file (values.yaml)

Deploy all app services for a given namespace with the following characteristics :

- 1 **deployment** named **fruitapp-v3-2-11** with
  - **2** replicas
  - **128Mi** max memory
- 1 **service** named **fruitapp-v3-2-11** load-balancing to pod from this release
- 1 **route** named **frontend** routing to the **fruitapp-v3-2-11 service**. This route could be shared among multiple version of the application

```bash
# base configuration running default configuration
helm install startx/example-fruitapp-app
```

## History

| Release | Date       | Description                                                   |
| ------- | ---------- | ------------------------------------------------------------- |
| 9.8.239 | 2022-05-28 | Initial commit for this helm chart with default value example |
| 9.8.253 | 2022-05-29 | Align all charts dependencies to release 9.8.251
| 9.8.277 | 2022-05-31 | publish stable update for the full repository
| 9.15.1 | 2022-06-01 | Align all chart for Openshift 4.9.15
| 9.15.2 | 2022-06-01 | Align all charts to release 9.15.1

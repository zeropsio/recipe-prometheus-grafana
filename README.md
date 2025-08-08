# Zerops x Prometheus + Grafana

[Prometheus](https://prometheus.io/) is an open-source systems monitoring and alerting toolkit with a dimensional data model, flexible query language, efficient time series database and modern alerting approach.  
[Grafana](https://grafana.com/) is a multi-platform open-source analytics and interactive visualization web application that provides charts, graphs, and alerts for the web when connected to supported data sources.  
[Zerops](https://zerops.io) recipe for Prometheus + Grafana includes a monitoring stack with PostgreSQL DB and automated backups.

![prometheus-grafana](https://raw.githubusercontent.com/zeropsio/recipe-shared-assets/main/covers/svg/cover-prometheus-grafana.svg)

<br/>

## Deploy on Zerops
You can either click the deploy button to deploy directly on Zerops, or manually copy the [import yaml](https://github.com/zeropsio/recipe-prometheus-grafana/blob/main/zerops-project-import.yml) to the import dialog in the Zerops app.

[![Deploy on Zerops](https://raw.githubusercontent.com/zeropsio/recipe-shared-assets/main/deploy-button/green/deploy-button.svg)](https://app.zerops.io/recipe/prometheus-grafana)

<br/>

## Recipe features

- Prometheus running on a **Zerops Alpine** service with automatic snapshots
- Grafana running on a **Zerops Alpine** service with dashboard support
- Zerops **PostgreSQL 17** service as Grafana database
- Zerops **Object Storage** service for automated data backups
- Utilization of a Zerops built-in **environment variables** system

<br/>

## Production vs. development

Base of the recipe is ready for production, the difference comes down to:

- Use a highly available version of the PostgreSQL database (change `mode` from `NON_HA` to `HA` in recipe YAML, `db` service section)

<br/>

## Changes made over the default installation

If you want to modify your existing Prometheus + Grafana setup to efficiently run on Zerops, these are the general steps we took:

- Add [zerops.yml](https://github.com/zeropsio/recipe-prometheus-grafana/blob/main/zerops.yml) to your repository. Our example includes installation of specified versions, automated backups and health checks.
- Configure Grafana to use PostgreSQL as a database backend instead of SQLite for better performance and reliability.
- Set up automated Prometheus data snapshots and restores with object storage backups every hour.

### Included dashboards

- **Zerops/Service Metrics** dashboard to show standard Zerops metrics for services within the project.
- **Zerops/Redis** dashboard, based on `oliver006/redis_exporter` dashboard, customised for Zerops service discovery.
- **Zerops/MariaDB** dashboard, based on official Prometheus Mysqld exporter dashboard (`14057`), updated and customised for Zerops service discovery.
- **Zerops/PostgreSQL** dashboard, based on `egmont1227` dashboard (`12485`), updated for `pgsty/pg_exporter` and customised for Zerops service discovery.
- **Zerops/HAProxy** dashboard, based on `rfmoz/grafana-dashboards` dashboard.
  - TODO: customisation for Zerops service discovery

<br/>

## Additional info

Grafana admin login for this recipe is `admin` with automatically generated password,
which can be found under `GF_SECURITY_ADMIN_PASSWORD` name in the Zerops Environment variables section of `grafana` service.

<br/>
<br/>

Need help setting your project up? Join [Zerops Discord community](https://discord.com/invite/WDvCZ54).

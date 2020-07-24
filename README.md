# Local environment bundle for frontend developer

## Overview
The repository contains files to setup Magento development environment for working with the platform theming.

## Files overview 
 * The bundle contains files the will be mapped to container:
   * Magento and Atwix theme files
     * `app/design`
   * Atwix module files
     * `app/code/Atwix`
 * `docker-compose.yml` file for docker local environment installation
 
## Docker container image 
Image name: `atwixdotcom/frontend_env` hosted on `atwixdotcom` dockerhub.
 
Docker image(all in one) contains all needed software to run Magento installation and contains:
 - OS: `Ubuntu 20.04 LTS focal`
 - Webserver: `nginx/1.18.0`
 - PHP: `7.3.20 + FPM`
 - MySQL: `8.0.20`
 - ElasticSearch: `7.8.0`
 - Magento: `dev-2.4-develop 25.07.2020 build`
 
## Magento Details
- URL: http://magento-local.com:30800/
- Admin route: `/admin`
- Admin user: `admin`
- Admin password: `admin123`
 
## Installation
### Before project installation
- Install docker: [link](https://docs.docker.com/get-docker/)
- Install docker-compose: [link](https://docs.docker.com/compose/install/)
- Docker on Windows: [link](https://docs.docker.com/docker-for-windows/)

### Project installation
1. Clone the repository 
1. Add record to hosts file - [how to](https://support.rackspace.com/how-to/modify-your-hosts-file/)
    ```
    127.0.0.1 magento-local.com
    ```   
1. Open terminal and go to folder with project
    ```bash
   cd /path/to/project/
   docker-compose up -d
    ```
1. Open local environment URL and check if it works (http://magento-local.com:30800/)

### Files modification
After the project installation, you will have the `src/app/code` and `src/app/design` directories in the project folder.
All changes in these directories will be automatically synced with the Docker environment.

> Please note that not all Magento directories and files are present in the `src` directory but modules dir (`app/code`) and theme dir (`app/design`). Basically, everything you need for basic styling and layout changes.

### Connection to container
For trivial tasks, you don't need to connect to the Docker container (see "Files modification" section). 
But this possibility is still present.

1. Via SSH or SFTP client
    - user: `dev`
    - password: `admin123`
    - host: `localhost`
    - port: `30022`
    - Magento installation path: `/var/www/magento`
1. Via Docker + Terminal
    - Open terminal
    - Run command
    ```
    docker attach ATWIX_MAGENTO_FRONT_ENV
    ```
1. Via Docker Dashboard
    - Open Docker app dashboard
    - Select container `ATWIX_MAGENTO_FRONT_ENV`
    - Click on CLI button
    
## Magento development 

### Clearing the cache
You need to clear the cache to apply some modifications (like XML layout change). The cache clearing is available from the admin panel.

```
Admin -> System -> Cache Management
```

### Working with Magento themes

You may find information about the theme structure in the [Magento Theme Structure](https://devdocs.magento.com/guides/v2.4/frontend-dev-guide/themes/theme-structure.html) doc.
All other information about frontend development may be found in the [Official DevDocs Documentation](https://devdocs.magento.com/guides/v2.4/frontend-dev-guide/bk-frontend-dev-guide.html)
    

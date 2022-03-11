# Docker Reverse Proxy

Base project for reverse proxy functionality with HTTPS/SSL Let's Encrypt support and automatic renewal of the generated certificates.

## Installation and usage

1.  Clone this repository

2.  Setup `DEFAULT_EMAIL` in `.env` file

3.  Run `launch.sh` script for setup or run of the proxy container.
    The launch script contains 4 options:

    1. **Proxy setup**: the creation of a Docker network needed for proxy and other containers

    2. **Starting of proxy containers**

    3. **Stoping of proxy containers**

    4. **Exiting the script**

4.  Each container that is supposed to be proxied through with container and its (sub)domain needs to be connected to docker network (default is **`proxy-net`** ) and contain these environment variables:

    1. **VIRTUAL_HOST** = domain or subdomain
    2. **LETSENCRYPT_HOST** = domain or subdomain (same value as the VIRTUAL_HOST)
    3. **VIRTUAL_PORT** = port inside of the proxied container (all the containers are in the same docker network, that's why it needed the INSIDE port)

    These environment variables can be used in the `docker run` command or in the `docker-compose.yml` script like:

    ```
    environment:
      VIRTUAL_HOST: my-sub.domain.com
      LETSENCRYPT_HOST: my-sub.domain.com
      VIRTUAL_PORT: 3000
    ```

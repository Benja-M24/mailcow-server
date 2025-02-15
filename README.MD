# how to use Mailcow service behaind a reverse proxy (traefiv v2 o upper)
1. Clone from https://github.com/mailcow/mailcow-dockerized/
2. Always manage your mailcow folder with root permisions
3. Execute ./generate_config.sh
4. Configure like .env example:
    - set SKIP_LETS_ENCRYPT=y to use letsencrypt from traefik
    - verify your MAILCOW_HOSTNAME=mail.example.com
    - Modify the default HTTP and HTTPS ports. Traefik will use the default ports 80 and 443.
    ```
        HTTP_PORT=8080
        HTTP_BIND=127.0.0.1

        HTTPS_PORT=8443
        HTTPS_BIND=127.0.0.1
    ```
5. Edit the docker-compose.yml file adding the Traefik labels on:
    - postfix (delete opened ports)
    - dovecot 
    - nginx
6. Edit the docker-compose.yml file adding certdumper service
7. Edit the docker-compose.yml file adding external traefik network and connecting required services to it
8. Run docker compose up 


# About reverse proxy configuration check my on: 
https://github.com/Benja-M24/traefik-ServerManager.git
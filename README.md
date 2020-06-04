# Theia IDE In Docker

You don't need to have a local development environment

Simple, install this on your development server

## How to install
1) Clone this project
2) Run
`make up` or `docker-compose up -d`
3) Access your server url using the 3000 port.
Example:
```
yourdomain.com:3000
localhost:3000
```

### Other options
- You can copy `docker-compose.override.example.yml` to `docker-compose.override.yml` and
add traefik proxy to add url and password to access your Theia IDE

IMPORTANT: If you use the Traefik, remove the ports params in the docker-compose.yml for security.

- Look the `.env` file to see others options.


# Countdown+ Deploy

Countdown+ backend and website deployment process utilizing Docker.

## Getting Started

- Rename `app_local.env.sample` to `app_local.env` and fill in required environment variables.
- If using VSCode: Right click on `docker-compose-local.yml` and select `Compose Up` from context menu.
- To perform the same action in the command line: `"/bin/bash '-l', '-c', 'docker compose -f "docker-compose-local.yml" up -d --build'"`

## Troubleshooting

### Docker error: At least one signature is invalid

Sample console output:

```
0.352 Err:1 http://deb.debian.org/debian bullseye InRelease
0.352   At least one invalid signature was encountered.
0.398 Err:2 http://deb.debian.org/debian-security bullseye-security InRelease
0.398   At least one invalid signature was encountered.
0.446 Err:3 http://deb.debian.org/debian bullseye-updates InRelease
0.446   At least one invalid signature was encountered.
```

Clean up the docker system cache as [shared on SO](https://stackoverflow.com/a/65524014)

- `docker system prune`
- `docker system df`

To clear only the build cache:

- `docker builder prune`

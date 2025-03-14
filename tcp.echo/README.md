# tcp.echo

Listens on tcp port `12345` and will echo back whatever is sent to the server.

## Requirements

- nc
- Compose compatible host

## Setup

The `setup.sh` script will install the Open Source Zilla image in a Compose stack along with any necessary services defined in the [compose.yaml](compose.yaml) file.

```bash
./setup.sh
```

- alternatively with the docker compose command:

```bash
docker compose up -d
```

### Verify behavior

```bash
nc localhost 12345
```

Type a `Hello, world` message and press `enter`.

output:

```text
Hello, world
Hello, world
```

## Teardown

The `teardown.sh` script will remove any resources created.

```bash
./teardown.sh
```

- alternatively with the docker compose command:

```bash
docker compose down --remove-orphans
```

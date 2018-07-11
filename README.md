# Docker Farm

[![License: MIT][MIT badge]][MIT]

Set of [Dockerfiles] and a [Make] based wrapper for buildig [Docker] images.

## Usage

Just hit "make" to see usage:

```
$ make

Usage: make <COMMAND> NAME=<name> [OPTIONS]

COMMANDS
    build
    push
    list
    run 
    login
    logout

OPTIONS
    DOCKER_ID=<docker_id> (default: aialferov)
    VERSION=<version> (default: latest)
    CMD=<cmd> (makes sense for "run" only)
```

<!-- Links -->

[MIT]: https://opensource.org/licenses/MIT
[Make]: https://www.gnu.org/software/make
[Docker]: https://www.docker.com
[Dockerfiles]: https://docs.docker.com/engine/reference/builder

<!-- Badges -->
[MIT badge]: https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square

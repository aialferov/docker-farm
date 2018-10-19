# Docker Farm

[![License: MIT][MIT Badge]][MIT]

Set of [Dockerfiles] and a [Make] based wrapper for building [Docker] images.

## Usage

Just hit "make" to see usage:

```
$ make
Usage: make <Target> [Variables]

Current tag: docker.io/aialferov/example:1.0.0
Dockerfile: images/example/Dockerfile

Adjustable with Variables, see below.

Targets
    edit           Edit current Dockerfile
    delete         Delete current Dockerfile along with the containing folder
    list           List available Dockerfiles
    build          Build image from current Dockerfile and set current tag
    push           Push current tag
    release        Create the "latest" tag on the current one and push both tags
    local-release  Create the "latest" tag on the current one
    shell          Run container of current tag image and exec shell in it
    clean          Prune everything with label "PROJECT=$PROJECT"
    distclean      Remove images current and "latest" tags
    login          Login to the current registry as current user
    logout         Logout from the current registry

Variables
    PROJECT        Image name (current: example)
    VERSION        Image version (current: 1.0.0)
    REGISTRY       Docker registry (current: docker.io)
    USER           Docker ID (current: aialferov)
    EDITOR         Editor to edit a Dockerfile (current: vim)
```

<!-- Links -->

[MIT]: https://opensource.org/licenses/MIT
[Make]: https://www.gnu.org/software/make
[Docker]: https://www.docker.com
[Dockerfiles]: https://docs.docker.com/engine/reference/builder

<!-- Badges -->

[MIT Badge]: https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square

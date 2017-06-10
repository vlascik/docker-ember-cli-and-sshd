# docker-ember-cli-and-sshd

Example of using ember-cli in Docker container with project volume in tmpfs and accessible via SFTP/ssh.

## Why?

Easy way to setup multiple developer machines. Also, running `ember-cli` in docker on a Linux host/VM cuts rebuild times by half - two thirds compared to Windows.

## Prerequisites

You will need the following things properly installed on your computer.

* [Docker with Docker Compose](https://www.docker.com/)

## Installation

* `git clone https://github.com/vlascik/docker-ember-cli-and-sshd`
* `cd docker-ember-cli-and-sshd`
* `./compose.sh`

## Running / Development

* start the container with `./compose.sh`
* Configure your IDE to automatically sync your project directory (including node_modules etc.) to `sshd` container's (default port 2222) via SFTP, to `/volumes/ember/<your-app>`
* Visit your ember app at [your-docker-host:4200](http://your-docker-host:4200).

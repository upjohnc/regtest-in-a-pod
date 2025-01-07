# Install

First, make sure you have [Podman](https://podman.io/) installed on your computer. Also useful (but not required) is the [`just`](https://just.systems/) cli tool.

Second, create a directory called `podman` somewhere on your machine and clone the repo:

```shell
mkdir ~/podman/
git clone https://github.com/thunderbiscuit/regtest-in-a-pod.git
```

Get into the container's directory and build the container:

```shell
cd regtest-in-a-pod/
podman machine start regtest
podman --connection regtest build --tag localhost/regtest:v1.0.0 --file ./Containerfile
podman create --name RegtestBitcoinEnv --publish 18443:18443 --publish 18444:18444 --publish 3002:3002 --publish 3003:3003 --publish 60401:60401 localhost/regtest:v1.1.0
```

You're now ready to start using the container! See the [Usage](./usage.md) page for all the details.

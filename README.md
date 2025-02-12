# Readme
This repo is a companion to the [Using Podman Containers for Regtest Bitcoin Development](https://thunderbiscuit.com/posts/podman-bitcoin/) blog article.

It allows you to create a robust regtest environment which you can turn on and off at will using Podman. The final environment includes a lot of useful tools, namely:
1. A bitcoin core node and daemon (serving compact block filters)
2. bitcoin-cli enabled
3. An Electrum server
4. An Esplora server
5. A block explorer
6. Useful just commands for working with the daemon from your command line

Read the article linked above for all the information on how to use the container to its fullest, but here is a quick cheatsheet:

## Usage
You can use the [`just`](https://github.com/casey/just) tool and leverage the commands defined in the `justfile`.

```shell
just mine 21
just sendto <address>
just bitcoindlogs
just esploralogs
```

## Building, Starting, and Stopping the Pod
```shell
# Building the container
cd ~/podman/regtest-in-a-pod/
podman machine start regtest
podman --connection regtest build --tag localhost/regtest:v1.0.0 --file ./Containerfile
podman create --name RegtestBitcoinEnv --publish 18443:18443 --publish 18444:18444 --publish 3002:3002 --publish 3003:3003 --publish 60401:60401 localhost/regtest:v1.1.0
```

```shell
# Using the container
cd ~/podman/regtest-in-a-pod/
podman machine start regtest
podman start RegtestBitcoinEnv
# mine 4 blocks
just mine 4
# execute bitcoin-cli command directly in pod
just cli getnetworkinfo
# launch block explorer
just explorer

# Stop the container and the machine
just stop
```

# Usage

Start the podman machine and `RegtestBitcoinEnv` container to fire up all services:

```shell
cd ~/podman/regtest-in-a-pod/
just start

# Alternatively, use
podman machine start regtest
podman start RegtestBitcoinEnv
```

From there you have access to a range of tools, all described below.

<br>

## 1. Bitcoin Core Full Node

```shell
# Mine 1 block
just mine

# Mine 10 blocks
just mine 10

# send 50 coins to specified address
just sendto <address>
```

To make full use of the node, load up the shell aliases contained in the `aliases.sh` file:

```shell
source aliases.sh
```

From there you can use the bitcoin-cli tool directly using the `podcli` alias:

```shell
podcli getblockchaininfo
```

## 2. Block Explorer

You'll find a simple block explorer ([Fast Bitcoin Block Explorer](https://github.com/RCasatta/fbbe)) at `http://127.0.0.1:3003` in your browser.

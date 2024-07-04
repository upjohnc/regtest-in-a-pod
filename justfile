@default:
  just --list

podshell:
  podman exec -it RegtestBitcoinEnv /bin/bash

logs:
  podman logs RegtestBitcoinEnv

stop:
  podman stop RegtestBitcoinEnv

explorer:
  open http://127.0.0.1:3003

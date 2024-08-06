@default:
  just --list

@cookie:
  podman exec RegtestBitcoinEnv cat /root/.bitcoin/regtest/.cookie | cut -d ':' -f2

@mine BLOCKS="1":
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE generatetoaddress {{BLOCKS}} bcrt1q6gau5mg4ceupfhtyywyaj5ge45vgptvawgg3aq

@sendto ADDRESS:
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE generatetoaddress 1 {{ADDRESS}}

podshell:
  podman exec -it RegtestBitcoinEnv /bin/bash

explorer:
  open http://127.0.0.1:3003

logs:
  podman logs RegtestBitcoinEnv

bitcoindlogs:
  podman exec -it RegtestBitcoinEnv tail -f /root/log/bitcoin.log

esploralogs:
  podman exec -it RegtestBitcoinEnv tail -f /root/log/esplora.log

explorerlogs:
  podman exec -it RegtestBitcoinEnv tail -f /root/log/fbbe.log

stop:
  podman stop RegtestBitcoinEnv && podman machine stop regtest

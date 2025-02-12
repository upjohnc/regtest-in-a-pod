[doc("List all available commands.")]
@default:
  just --list --unsorted

[doc("Print the current session cookie to console.")]
@cookie:
  podman exec RegtestBitcoinEnv cat /root/.bitcoin/regtest/.cookie | cut -d ':' -f2

[doc("Mine a block, or mine <BLOCKS> number of blocks.")]
@mine BLOCKS="1":
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE generatetoaddress {{BLOCKS}} bcrt1q6gau5mg4ceupfhtyywyaj5ge45vgptvawgg3aq

[doc("Send mining reward to <ADDRESS>")]
@sendminingrewardto ADDRESS:
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE generatetoaddress 1 {{ADDRESS}}

[doc("Send 1 bitcoin to <ADDRESS> using the default wallet.")]
@sendto ADDRESS:
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE -rpcwallet=podmanwallet sendtoaddress {{ADDRESS}} 1

[doc("Enter the shell in the pod.")]
podshell:
  podman exec -it RegtestBitcoinEnv /bin/bash

[doc("Send a command to bitcoin-cli")]
@cli COMMAND:
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE {{COMMAND}}

[doc("Open the block explorer.")]
explorer:
  open http://127.0.0.1:3003

[doc("Print all logs to console.")]
logs:
  podman logs RegtestBitcoinEnv

[doc("Print bitcoin daemon logs to console.")]
bitcoindlogs:
  podman exec -it RegtestBitcoinEnv tail -f /root/log/bitcoin.log

[doc("Print Esplora logs to console.")]
esploralogs:
  podman exec -it RegtestBitcoinEnv tail -f /root/log/esplora.log

[doc("Print block explorer logs to console.")]
explorerlogs:
  podman exec -it RegtestBitcoinEnv tail -f /root/log/fbbe.log

[doc("Start your podman machine and regtest environment.")]
start:
  podman machine start regtest
  podman start RegtestBitcoinEnv

[doc("Stop your podman machine and regtest environment.")]
stop:
  podman stop RegtestBitcoinEnv
  podman machine stop regtest

[doc("Serve the local docs.")]
servedocs:
  mkdocs serve

[doc("Open the website for docs.")]
docs:
  open https://thunderbiscuit.github.io/regtest-in-a-pod/

[doc("Create a default wallet.")]
@createwallet:
  COOKIE=$(just cookie) \
  && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE createwallet podmanwallet \
  && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE -rpcwallet=podmanwallet settxfee 0.0001

[doc("Print an address from the default wallet.")]
@newaddress:
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE -rpcwallet=podmanwallet getnewaddress

[doc("Print the balance of the default wallet.")]
@walletbalance:
  COOKIE=$(just cookie) && bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE -rpcwallet=podmanwallet getbalance

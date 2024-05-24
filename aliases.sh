COOKIE=$(podman exec RegtestBitcoinEnv cat /root/.bitcoin/regtest/.cookie | cut -d ':' -f2)

# Print the cookie password for this session to the console
alias podcookie="podman exec -i RegtestBitcoinEnv cat /root/.bitcoin/regtest/.cookie | cut -d ':' -f2"

# Common bitcoin-cli commands
alias podcli="bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE"
alias podmine="bitcoin-cli --chain=regtest --rpcuser=__cookie__ --rpcpassword=$COOKIE generatetoaddress 1 bcrt1q6gau5mg4ceupfhtyywyaj5ge45vgptvawgg3aq"

# Podman related commands
alias podshell="podman exec -it RegtestBitcoinEnv /bin/bash"
alias podlogs="podman logs RegtestBitcoinEnv"
alias podstop="podman stop RegtestBitcoinEnv"

# Open the block explorer in a browser
alias explorer="open http://127.0.0.1:3003"

#### Agoric Validation for Fun & Profit

1. First you need to get your address which is kept in your keychain. Execute the following command for that.
```console
ski@bengal:~$ ag-cosmos-helper keys list
```
The output will give you your account address and your public key. The account address is always prefixed with "agoric", whilst your public key has the prefix 'agoricpub'. For our purposes, just remember the name of the key. There is another address you will need, which is the validator address. 
```console
ag-cosmos-helper keys show <key alias> --bech val -a
```
The output gives you your validator address. These are always prefixed with 'agoricvaloper'. You can find details of these addresses here [Cosmos Accounts](https://docs.cosmos.network/master/basics/accounts.html). You can also find these addresses on your Validator page on Big Dipper. Mine is here [Tsahn](https://testnet.explorer.agoric.net/validator/agoricvaloper1as36fg3sfprf0w8yk58hyxq06z80puf36v4qsq).

2. To find out your rewards from being an Agoric validator you can run the following command
```console
ag-cosmos-helper query distribution rewards `ag-cosmos-helper keys show -a <key-alias>`
```
3. To find out your comissions from your delegators you can run the following command
```console
ag-cosmos-helper query distribution commission `ag-cosmos-helper keys show -a <key-alias> --bech=val`
```
You should see your current return on renting that container in the cloud or running your own to host the Agoric validator node. At this point you can either keep those uagstake where it is or you can withdraw it. Since this gist is about withdrawing them, lets do just that.

4. First you need the chain id. Which you can get using the following command if you hadn't noted it down from setting up your Agoric validator node.

```console
chainName=`curl https://testnet.agoric.net/network-config | jq -r .chainName`
```

You can withdraw both your rewards and you commission using a single command like below.
```console
ag-cosmos-helper tx distribution withdraw-rewards `ag-cosmos-helper keys show -a <key-alias> --bech=val` --from=<key-alias> --commission --dry-run --chain-id=$chainName
```
I have used ---dry-run to find out what the current gas charges are for my transaction. At this moment, the Agoric Testnet is not charging any gas fees so it doesn't matter. At some point, the Testnet will start charging gas so dry-runs are a handy way of knowing how much a transaction is going to cost you. The command will ask you for your keychain password twice before displaying the gas fees.

You can execute the transaction without the --dry-run flag. After you have given your keychain password twice, the command will ask you to confirm before signing and broadcasting. If you agree to it, the transaction will indeed be signed and broadcast to the chain. At this point you can head over to the Big Dipper [transactions page](https://testnet.explorer.agoric.net/transactions) and you will be able to see your transactions. 

5. With that done, you should now be able to check your balance to see your rewards and commisions deposited in your wallet. 
```console
ag-cosmos-helper query bank balances `ag-cosmos-helper keys show -a <key-alias>`
```

---

References

Since Agoric run on top of Cosmos/Tendermint most of the commands from across the Comos ecosystem are also valid ag-cosmos-helper commands. The following references were used in writing this gist.

[Agoric Validator Guide](https://gist.github.com/dckc/c6d4c5800daca0bd3439aee3e024b317)

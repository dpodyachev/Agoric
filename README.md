# Agoric

Security
=================================
After installation I searched security steps for protect my node and how to tune it.
I recommend implement security fix 
/root/.ag-cosmos-helper/config/config.toml from https://github.com/cosmos/gaia/blob/master/docs/validators/security.md

Sentry nodes can be quickly spun up or change their IP addresses. Because the links to the sentry nodes are in private IP space, an internet based attacked cannot disturb them directly. This will ensure validator block proposals and votes always make it to the rest of the network.

To setup your sentry node architecture validators nodes should edit their config.toml:

\# Comma separated list of nodes to keep persistent connections to
\# Do not add private peers to this list if you don't want them advertised
persistent_peers =[list of sentry nodes]

\# Set true to enable the peer-exchange reactor
pex = false

\# Sentry Nodes should edit their config.toml:
\# Comma separated list of peer IDs to keep private (will not be gossiped to other peers)
\# Example ID: 3e16af0cead27979e1fc3dac57d03df3c7a77acc@3.87.179.235:26656

private_peer_ids = "node_ids_of_private_peers"

=================================
Knowladge transfer before create validator: 
Validator's PubKey: The private key associated with this Tendermint PubKey is used to sign prevotes and precommits.
Validator's Address: Application level address. This is the address used to identify your validator publicly. The private key associated with this address is used to delegate, unbond, claim rewards, and participate in governance.
Validator's node name (moniker)
Validator's website (Optional)
Validator's description (Optional)
Initial commission rate: The commission rate on block rewards and fees charged to delegators.
Maximum commission: The maximum commission rate which this validator can charge. This parameter cannot be changed after create-validator is processed.
Commission max change rate: The maximum daily increase of the validator commission. This parameter cannot be changed after create-validator is processed.
Minimum self-delegation: Minimum amount of Atoms the validator needs to have bonded at all time. If the validator's self-delegated stake falls below this limit, their entire staking pool will unbond.
=================================
Fonded bug https://github.com/forbole/big-dipper/issues/493
=================================
Restore steps after system falls down:

1. install new node, sync and init it with old node name:
ag-chain-cosmos init --chain-id agorictest-7 name_of_my_brocken_node

2. recovery old wallet name like:
ag-cosmos-helper keys add --recover name_of_my_wallet

3. ask to reset and delegate it to faucet

4. create validator with "ag-cosmos-helper tx staking create-validator ... " ?

=================================
checking status
ag-cosmos-helper status --log_level panic  2>&1 | jq .NodeInfo.network,.NodeInfo.moniker,.ValidatorInfo.VotingPower,.SyncInfo.catching_up

dev Agoric https://devnet.explorer.agoric.net/validator/agoricvaloper16ekrqhaqjdg554ujyz8jrt26qaslevvfexkd39

bot faucet logical steps:
https://github.com/Agoric/faucet/blob/7e7e97e42d0f231ac9b0517d60d336fac40ca731/src/main.js#L109

https://gist.github.com/0xd18b/6b619e80c56f197066bb45da84b54d4e yum instalation for AWS EC2


same validator example:
https://testnet.explorer.agoric.net/validator/agoricvaloper1hjelee724ajkac26z9grrenchg5ynrz2qjp4w8
https://testnet.explorer.agoric.net/validator/1AC8D58222BD4B63B301F0850388670720172945


wget -qO- http://217.73.86.206:26660/metrics |grep -e ^tendermint_consensus_validators\{ -e ^tendermint_consensus_latest_block_height\{ -e ^tendermint_consensus_validator_power{ -e tendermint_p2p_peers\{|cut -d' ' -f2
73090
50
121
4


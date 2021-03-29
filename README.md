# Agoric

Restore steps after system falls down:

1. install new node, sync and init it with old node name:
ag-chain-cosmos init --chain-id agorictest-7 name_of_my_brocken_node

2. recovery old wallet name like:
ag-cosmos-helper keys add --recover name_of_my_wallet

3. ask to reset and delegate it to faucet

4. create validator with "ag-cosmos-helper tx staking create-validator ... " ?


checking status
ag-cosmos-helper status --log_level panic  2>&1 | jq .NodeInfo.network,.NodeInfo.moniker,.ValidatorInfo.VotingPower,.SyncInfo.catching_up

dev Agoric https://devnet.explorer.agoric.net/validator/agoricvaloper16ekrqhaqjdg554ujyz8jrt26qaslevvfexkd39

bot faucet logical steps:
https://github.com/Agoric/faucet/blob/7e7e97e42d0f231ac9b0517d60d336fac40ca731/src/main.js#L109

https://gist.github.com/0xd18b/6b619e80c56f197066bb45da84b54d4e yum instalation for AWS EC2


same validator example:
https://testnet.explorer.agoric.net/validator/agoricvaloper1hjelee724ajkac26z9grrenchg5ynrz2qjp4w8
https://testnet.explorer.agoric.net/validator/1AC8D58222BD4B63B301F0850388670720172945

https://testnet.explorer.agoric.net/validator/1AC8D58222BD4B63B301F0850388670720172945

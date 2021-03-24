# Agoric
dev Agoric https://devnet.explorer.agoric.net/validator/agoricvaloper16ekrqhaqjdg554ujyz8jrt26qaslevvfexkd39

checking status
ag-cosmos-helper status --log_level panic  2>&1 | jq .NodeInfo.network,.NodeInfo.moniker,.ValidatorInfo.VotingPower,.SyncInfo.catching_up

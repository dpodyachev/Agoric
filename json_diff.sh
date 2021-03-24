Compare two JSONs with jq

jq will sort (-S) the whole file (.) and compare STDOUT (<()) with diff

diff <(jq -S . A.json) <(jq -S . B.json)


For compare by key you can use:

diff <(jq 'keys' file1.json) <(jq 'keys' file2.json)

This will just give you the list of keys that are different.

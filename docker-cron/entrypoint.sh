#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

testnet=0
disablewallet=0
printtoconsole=1
addressindex=1
txindex=1
server=1
rpcclienttimeout=30
rpcport=9998
rpcuser=inviewrpc
rpcpassword=u7SV2ApjNmaiF5Y037h58CpWBGZLBDGULsYqzf6/nJdK

if [ ! -e "$HOME/.pivx/pivx.conf" ]; then
    mkdir -p $HOME/.pivx

    echo "Creating pivx.conf"

    # Seed a random password for JSON RPC server
    cat <<EOF > $HOME/.pivx/pivx.conf
testnet=$testnet
disablewallet=0
printtoconsole=$disablewallet
addressindex=$addressindex
txindex=$txindex
server=$server
rpcclienttimeout=$rpcclienttimeout
rpcport=$rpcport
rpcuser=$rpcuser
rpcpassword=$rpcpassword
EOF

fi

touch $HOME/.pivx/pivx.out

cat $HOME/.pivx/pivx.conf

pivxd --daemon

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
* * * * * /run.sh >> $HOME/.pivx/pivx.out
# This extra line makes it a valid cron" > scheduler.txt

echo 'Intialization done'

crontab scheduler.txt
cron -f && tail -f $HOME/.pivx/pivx.conf
#!/bin/bash
set -e

testAlias+=(
	[polisd:trusty]='polisd'
)

imageTests+=(
	[polisd]='
		rpcpassword
	'
)

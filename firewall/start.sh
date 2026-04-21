#!/bin/sh
set -eu

nft -f /etc/nftables.conf

mkfifo -m 0666 /var/log/squid/access.log
mkfifo -m 0666 /var/log/squid/cache.log

# Forward pipes to stdout/stderr in background
cat /var/log/squid/access.log &
cat /var/log/squid/cache.log &

echo "[firewall] Initialising Squid cache directories..."
squid -z --foreground 2>&1 || true

echo "[firewall] Starting Squid..."
exec squid -NYCd1

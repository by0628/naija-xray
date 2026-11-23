#!/bin/sh
PORT="${PORT:-8080}"
if [ -z "$UUID" ]; then echo "UUID env not set"; exit 1; fi
sed -e "s/__PORT__/${PORT}/g" -e "s/__UUID__/${UUID}/g" /config.json.template > /config.json
exec /usr/local/bin/xray run -c /config.json

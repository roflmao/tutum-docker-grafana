#!/bin/bash
set -e

if [ -f /.graphite_configured ]; then
    echo "=> graphite has been configured!"
    exit 0
fi

if [ "${GRAPHITE_HOST}" = "**ChangeMe**" ]; then
    echo "=> No address of GRAPHITE is specified!"
    echo "=> Program terminated!"
    exit 1
fi

if [ "${GRAPHITE_PORT}" = "**ChangeMe**" ]; then
    echo "=> No PORT of GRAPHITE is specified!"
    echo "=> Program terminated!"
    exit 1
fi

echo "=> Configuring GRAPHITE"
sed -i -e "s/<--GRAPHITE_ADDR-->/${GRAPHITE_HOST}/g" \
    -e "s/<--GRAPHITE_PORT-->/${GRAPHITE_PORT}/g" /app/config.js

touch /.graphite_configured
echo "=> GRAPHITE has been configured as follows:"
echo "   GRAPHITE ADDRESS:  ${GRAPHITE_HOST}"
echo "   GRAPHITE PORT:     ${GRAPHITE_PORT}"
echo "   ** Please check your environment variables if you find something is misconfigured. **"
echo "=> Done!"

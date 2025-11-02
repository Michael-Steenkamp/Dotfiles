#!/bin/bash

NETWORK_STATUS=$(nmcli networking)

if [ "$NETWORK_STATUS" == "enabled" ]; then
    nmcli networking off
elif [ "$NETWORK_STATUS" == "disabled" ]; then
    nmcli networking on
else
  echo "Unknown status: $NETWORK_STATUS"
fi

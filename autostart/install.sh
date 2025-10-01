#!/usr/bin/env bash
set -e
USER_NAME="${1:-$USER}"
sudo cp fastbot-docker@.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable fastbot-docker@${USER_NAME}.service
sudo systemctl start fastbot-docker@${USER_NAME}.service
echo "Enabled autostart for user ${USER_NAME}."

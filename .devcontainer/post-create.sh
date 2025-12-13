#!/usr/bin/env bash
set -e

# Only install if aws is not already available
if ! command -v aws >/dev/null 2>&1; then
    echo "Installing AWS CLI v2 globally..."

    # Use /tmp for temporary download, outside your repo
    TEMP_DIR=$(mktemp -d)
    cd $TEMP_DIR

    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
    unzip -q awscliv2.zip
    sudo ./aws/install

    # Clean up
    cd ~
    rm -rf $TEMP_DIR

    echo "AWS CLI installed successfully!"
else
    echo "AWS CLI already installed"
fi

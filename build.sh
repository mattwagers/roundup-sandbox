#!/bin/bash
set -e  # exit immediately on any error

echo "→ Installing Quarto ${QUARTO_VERSION}"
QUARTO_URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
mkdir -p /opt/quarto
wget -qO- "$QUARTO_URL" | tar -xz -C /opt/quarto --strip-components=1
export PATH="/opt/quarto/bin:$PATH"

echo "→ Quarto version: $(quarto --version)"

echo "→ Rendering site"
quarto render
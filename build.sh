#!/bin/bash
set -e

echo "→ Installing Quarto ${QUARTO_VERSION}"
QUARTO_URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
mkdir -p "${HOME}/quarto"
wget -qO- "$QUARTO_URL" | tar -xz -C "${HOME}/quarto" --strip-components=1
export PATH="${HOME}/quarto/bin:$PATH"

echo "→ Quarto version: $(quarto --version)"

echo "→ Rendering site"
quarto render

echo "→ Building search index"
npx -y pagefind --site _site
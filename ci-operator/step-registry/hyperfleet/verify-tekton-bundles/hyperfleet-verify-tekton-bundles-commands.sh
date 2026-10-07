#!/bin/bash

set -euo pipefail

echo "=== HyperFleet Tekton Bundle Verification ==="

HOOKS_VERSION="v0.3.0"
HOOKS_URL="https://github.com/openshift-hyperfleet/hyperfleet-hooks/releases/download/${HOOKS_VERSION}/hyperfleet-hooks-linux-amd64"
HOOKS_BIN="/tmp/hyperfleet-hooks"

echo "Downloading hyperfleet-hooks ${HOOKS_VERSION}..."
curl -fsSL --retry 3 -o "${HOOKS_BIN}" "${HOOKS_URL}"
chmod +x "${HOOKS_BIN}"

echo "Verifying pinned Tekton bundle digests..."
make verify-tekton-bundles HYPERFLEET_HOOKS="${HOOKS_BIN}"

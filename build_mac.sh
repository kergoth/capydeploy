#!/bin/bash

set -euo pipefail

(
    cd apps/hub-tauri
    cargo tauri build || :
)

if [ -e target/release/bundle/macos/CapyDeploy\ Hub.app ]; then
    trash ~/Applications/CapyDeploy\ Hub.app
    cp -avf --reflink=always target/release/bundle/macos/CapyDeploy\ Hub.app ~/Applications/
fi

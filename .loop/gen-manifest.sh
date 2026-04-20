#!/usr/bin/env bash
# Run at top of each loop iteration to refresh route list.
set -euo pipefail
cd "$(dirname "$0")/.."
find app -name 'route.ts' | sed 's|app/||;s|/route.ts||' | sort > .loop/manifest.txt

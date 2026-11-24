#!/usr/bin/env bash
#
# Runs `jaspr serve` on this project's dedicated, non-standard ports so it can
# run at the same time as other Jaspr apps without localhost conflicts.
#
#   app server (browser)  : 8090   <- from `jaspr.port` in pubspec.yaml
#   dev asset proxy       : 5568   <- --proxy-port below (not read from pubspec)
#   Dart VM service        : 8181   <- fixed by jaspr; only one running Jaspr
#                                     app gets server-side hot reload.
#
# Any extra args are passed straight through to `jaspr serve`.

set -euo pipefail
cd "$(dirname "$0")/.."
exec jaspr serve --proxy-port 5568 "$@"

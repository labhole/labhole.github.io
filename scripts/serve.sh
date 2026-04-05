#!/usr/bin/env bash
# =============================================================================
# serve.sh — Start the Labhole Jekyll development server locally.
#
# Usage:
#   ./scripts/serve.sh            # Serve at http://localhost:4000
#   ./scripts/serve.sh --port 5000  # Serve on a custom port
#
# Prerequisites:
#   - Ruby (>= 2.7)
#   - Bundler (`gem install bundler`)
# =============================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

# ---- Helpers ----------------------------------------------------------------

info()  { printf "\033[1;32m▸ %s\033[0m\n" "$*"; }
error() { printf "\033[1;31m✖ %s\033[0m\n" "$*" >&2; }

# ---- Check prerequisites ----------------------------------------------------

if ! command -v ruby &>/dev/null; then
    error "Ruby is not installed. Please install Ruby (>= 2.7) first."
    error "See: https://www.ruby-lang.org/en/documentation/installation/"
    exit 1
fi

if ! command -v bundle &>/dev/null; then
    error "Bundler is not installed. Run: gem install bundler"
    exit 1
fi

# ---- Install dependencies (if needed) ---------------------------------------

info "Installing dependencies..."
bundle config set --local path 'vendor/bundle' 2>/dev/null
bundle install --quiet

# ---- Start the server -------------------------------------------------------

info "Starting Jekyll development server..."
info "Press Ctrl+C to stop."
echo

# Default to 0.0.0.0 so the server is accessible from the Windows host
# when running inside WSL. Override with --host 127.0.0.1 if desired.
bundle exec jekyll serve --watch --host 0.0.0.0 "$@"

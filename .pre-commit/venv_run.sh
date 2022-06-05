#!/bin/bash
p="$(cd "$(dirname "$0")"; pwd)"
cd "$p/.."
if python -c "import sys; exit(sys.prefix != sys.base_prefix)"; then
    source .venv/bin/activate
fi
cmd=$1
shift
exec "$cmd" "$@"

#!/bin/bash
p="$(cd "$(dirname "$0")"; pwd)"
cd "$p/.." || exit
# activate virtual environment if it is not already activated
if python -c "import sys; exit(sys.prefix != sys.base_prefix)"; then
    source .venv/bin/activate
fi
# first argument to this script is the command; execute it,
# and pass to it all additional arguments passed to this script, if any
cmd=$1
shift
exec "$cmd" "$@"

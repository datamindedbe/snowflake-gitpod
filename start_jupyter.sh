#!/bin/bash
p="$(cd "$(dirname "$0")"; pwd)"
cd "$p"
if python -c "import sys; exit(sys.prefix != sys.base_prefix)"; then
    echo "Activating virtual environment"
    source .venv/bin/activate
fi
echo "Starting Jupyter"
exec jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password=''
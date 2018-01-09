#!/usr/bin/env bash
set -e

SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
(source "${SCRIPT_DIR}/activate" && python -m jupyter notebook "${SCRIPT_DIR}/profiling.ipynb")
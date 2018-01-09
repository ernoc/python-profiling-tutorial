#!/usr/bin/env bash
set -e

SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
source "${SCRIPT_DIR}/environment"

PROJECT_ENV=${PROJECT_HOME}/.env
"${SCRIPT_DIR}/scripts/setup-conda.sh" "${PROJECT_ENV}"

if [ -z ${CONDA_PATH_BACKUP+x} ]; then export CONDA_PATH_BACKUP=""; fi
if [ -z ${PS1+x} ]; then export PS1=""; fi
(source "${PROJECT_ENV}/bin/activate" && conda env create -f environment.yml)

echo "Done. Start with ./launch.sh"

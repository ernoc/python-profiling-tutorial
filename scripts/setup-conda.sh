#!/usr/bin/env bash
set -e -u -x -o pipefail

ENV=$1

: ${MINICONDA_PREFIX:=Miniconda3}
: ${MINICONDA_VERSION:=latest}
: ${PYTHON_VERSION:=*}

# NOTE:
# Conda 4.4.0 renames default env from root to base and introduces other breaking changes:
# https://github.com/conda/conda/releases/tag/4.4.0

OS=$(uname -s)
if [ "${OS}" == "Linux" ]; then
    CONDA_FILE_NAME=${CONDA_FILE_NAME:-${MINICONDA_PREFIX}-${MINICONDA_VERSION}-Linux-x86_64.sh}
    # Intentially not using environment variables here!

elif [ "${OS}" == "Darwin" ]; then
    CONDA_FILE_NAME=${CONDA_FILE_NAME:-${MINICONDA_PREFIX}-${MINICONDA_VERSION}-MacOSX-x86_64.sh}
fi

MINICONDA_URL="https://repo.continuum.io/miniconda/${CONDA_FILE_NAME}"

# Install miniconda
SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
if [ ! -d "${ENV}" ]; then
    curl "${MINICONDA_URL}" > "${SCRIPT_DIR}/${CONDA_FILE_NAME}"
    bash "${SCRIPT_DIR}/${CONDA_FILE_NAME}" -b -p "${ENV}"
    rm "${SCRIPT_DIR}/${CONDA_FILE_NAME}"
    if [ "${MINICONDA_VERSION}" != "*" ]; then
        # pin the exact conda version
        echo "conda ==${MINICONDA_VERSION}" >> "${ENV}/conda-meta/pinned"
    fi
    if [ "${PYTHON_VERSION}" != "*" ]; then
         # pin the exact python version
        echo "python ==${PYTHON_VERSION}" >> "${ENV}/conda-meta/pinned"
    fi
fi

#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

INSTALL_PATH=$1
SHIBOKEN2_URL=$2
SHIBOKEN2_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] PYSIDE2 URL: ${SHIBOKEN2_URL}"
echo -e "[INSTALL][ARGS] SHIBOKEN2 VERSION: ${SHIBOKEN2_VERSION}"

cd ${INSTALL_PATH}

# We install Shiboken2
echo -e "\n"
echo -e "[INSTALL] Installing Shiboken2-${SHIBOKEN2_VERSION}..."
echo -e "\n"

# We call the pip command to install the Wheel file into our package.
pip2 install ${SHIBOKEN2_URL} --target ${INSTALL_PATH} --upgrade --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Finished installing Shiboken2-${SHIBOKEN2_VERSION}!"
echo -e "\n"

#!/usr/bin/bash

install_path=$1
shiboken2_version=$2
shiboken2_url=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] SHIBOKEN2 VERSION: ${shiboken2_version}"

cd $build_path

# We finally install Shiboken2
echo -e "\n"
echo -e "[INSTALL] Installing Shiboken2-${shiboken2_version}..."
echo -e "\n"

# We call the pip command to install the Wheel file into our package.
pip install ${shiboken2_url} --target ${install_path} --upgrade --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Finished installing Shiboken2-${shiboken2_version}!"
echo -e "\n"

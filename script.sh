#!/bin/bash

set -e

if [[ "$EUID" -ne 0 ]]; then
  echo "This script needs root privileges.. Please run with sudo"
  exit 1
fi

if ! command -v python3 &> /dev/null; then
  echo "Python3 is not installed"
  exit 1
fi

version=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
package="python$version-venv"

echo "Detected Python version $version"
echo "Installing $package"
apt install -y $package

echo "Installing Ripgrep"
apt install -y ripgrep

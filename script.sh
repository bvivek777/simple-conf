#!/bin/bash

set -euo pipefail

if [[ "$EUID" -ne 0 ]]; then
  echo "This script needs root privileges.. Please run with sudo"
  exit 1
fi

if ! command -v python3 &> /dev/null; then
  echo "Python3 is not installed"
  exit 1
fi

if command -v apt-get &> /dev/null; then
  PKG_MANAGER="apt"
elif command -v pacman &> /dev/null; then
  PKG_MANAGER="pacman"
else
  echo "Supported package manager (apt-get or pacman) not found"
  exit 1
fi

version=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
package="python$version-venv"

echo "Detected Python version $version"

if [[ "$PKG_MANAGER" == "apt" ]]; then
  echo "Installing $package via apt-get"
  apt-get update -y
  apt-get install -y "$package" ripgrep
else
  echo "Installing python and ripgrep via pacman"
  pacman -Sy --noconfirm python ripgrep
fi

#!/bin/bash
# Script to download BepInEx for building AIChat

set -e

BEPINEX_VERSION="5.4.23.4"
BEPINEX_URL="https://github.com/BepInEx/BepInEx/releases/download/v${BEPINEX_VERSION}/BepInEx_win_x64_${BEPINEX_VERSION}.zip"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSETS_DIR="${SCRIPT_DIR}/assets"
BUILD_ENV_DIR="${SCRIPT_DIR}/buildenv/mokgamedir"

echo "Downloading BepInEx v${BEPINEX_VERSION}..."

# Download BepInEx for build environment (core libraries for compilation)
if [ ! -d "${BUILD_ENV_DIR}/BepInEx" ]; then
    echo "Downloading BepInEx for build environment..."
    TMP_DIR=$(mktemp -d)
    cd "${TMP_DIR}"
    
    curl -L -o bepinex.zip "${BEPINEX_URL}"
    unzip -q bepinex.zip
    
    # Copy only BepInEx/core directory for compilation
    mkdir -p "${BUILD_ENV_DIR}/BepInEx"
    cp -r BepInEx/core "${BUILD_ENV_DIR}/BepInEx/"
    
    cd -
    rm -rf "${TMP_DIR}"
    echo "BepInEx core libraries installed for build environment."
else
    echo "BepInEx already exists in build environment."
fi

# Download BepInEx for release assets
if [ ! -d "${ASSETS_DIR}/BepInEx_win_x64_${BEPINEX_VERSION}" ]; then
    echo "Downloading BepInEx for release assets..."
    TMP_DIR=$(mktemp -d)
    cd "${TMP_DIR}"
    
    curl -L -o bepinex.zip "${BEPINEX_URL}"
    unzip -q bepinex.zip
    
    # Move all BepInEx files to assets
    mkdir -p "${ASSETS_DIR}/BepInEx_win_x64_${BEPINEX_VERSION}"
    mv BepInEx "${ASSETS_DIR}/BepInEx_win_x64_${BEPINEX_VERSION}/"
    mv winhttp.dll "${ASSETS_DIR}/BepInEx_win_x64_${BEPINEX_VERSION}/"
    mv doorstop_config.ini "${ASSETS_DIR}/BepInEx_win_x64_${BEPINEX_VERSION}/"
    mv changelog.txt "${ASSETS_DIR}/BepInEx_win_x64_${BEPINEX_VERSION}/"
    mv .doorstop_version "${ASSETS_DIR}/BepInEx_win_x64_${BEPINEX_VERSION}/"
    
    cd -
    rm -rf "${TMP_DIR}"
    echo "BepInEx downloaded for release assets."
else
    echo "BepInEx already exists in release assets."
fi

echo "BepInEx setup complete!"

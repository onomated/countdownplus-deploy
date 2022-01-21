#!/usr/bin/env bash

set -e

ELIXIR_DIR=countdownplus-elixir
NEXTJS_DIR=countdownplus-nextjs

echo "Updating services release artifacts from countdownplus elixir release"
if [ ! -d ../$ELIXIR_DIR/artifacts/releases/prod/ ]; then
  echo ''
  echo "‼️ Countdownplus elixir release not found ‼️"
  echo "‼️ Execute 'mix cplus.gen.release' from $ELIXIR_DIR root directory ‼️"
  exit -1
fi
rm -rf services/release
mkdir -p services/release
cp -Rf ../$ELIXIR_DIR/artifacts/releases/prod/ services/release

echo 'Updating frontend release artifacts from countdownplus nextjs build'
if [ ! -d ../$NEXTJS_DIR/artifacts/releases/prod/ ]; then
  echo ''
  echo "‼️ Countdownplus nextjs build directory does not exist ‼️"
  echo "‼️ Execute './scripts/release.js' from $NEXTJS_DIR root directory ‼️"
  exit -1
fi
rm -rf frontend/release
mkdir -p frontend/release
cp -Rf ../$NEXTJS_DIR/artifacts/releases/prod/ frontend/release

echo 'Done'
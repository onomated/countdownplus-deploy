#!/usr/bin/env bash

set -e

echo 'Updating services source from countdownplus elixir release'
if [ ! -d ../countdownplus-elixir/artifacts/releases/prod/ ]; then
  echo 'Countdownplus elixir release does not exist'
  exit -1
fi
cp -rf ../countdownplus-elixir/artifacts/releases/prod/ services/

echo 'TODO: Updating frontend source from countdownplus nextjs build'

echo 'Done'
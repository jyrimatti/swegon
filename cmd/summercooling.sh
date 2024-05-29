#! /usr/bin/env nix-shell
#! nix-shell --pure --keep LD_LIBRARY_PATH -i dash -I channel:nixos-23.11-small -p nix dash
set -eu

getset="${1:-}"
value="${4:-}"
if [ "$value" = "true" ] || [ "$value" = "1" ]; then
  value="5";
else
  value="0";
fi

. ./ouman_env.sh

if [ "$getset" = "Set" ]; then
  response="$(./ouman_post.sh summerCoolingFunctionMode $value)"
  echo 1
else
  echo "$(($(./ouman_get.sh summerCoolingFunctionMode) / 5))"
fi

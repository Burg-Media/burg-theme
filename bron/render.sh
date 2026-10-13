#!/bin/sh
# Renders ntp.html to the new tab page background (1x and 2x).
set -e
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
TMP=$(mktemp -d)

for scale in 1 2; do
  out=../images/ntp.png
  [ "$scale" = 2 ] && out=../images/ntp@2x.png
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --user-data-dir="$TMP" \
    --force-device-scale-factor=$scale \
    --window-size=2560,1600 \
    --virtual-time-budget=2000 \
    --screenshot="$PWD/$out" \
    "file://$PWD/ntp.html"
done

rm -rf "$TMP"
ls -l ../images/ntp*.png

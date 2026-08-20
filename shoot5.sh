#!/bin/bash
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="http://localhost:8931/index.html"
OUT=/tmp/coorg_shots
mkdir -p "$OUT"
for s in land coffee process people contact; do
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --window-size=1440,900 --virtual-time-budget=4000 \
    --screenshot="$OUT/v5_$s.png" "$URL?snap#$s" 2>/dev/null
done
ls -la "$OUT"/v5_*.png

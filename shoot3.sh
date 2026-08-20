#!/bin/bash
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="http://localhost:8931/index.html"
OUT=/tmp/coorg_shots
mkdir -p "$OUT"
for s in land coffee process people contact; do
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --window-size=1440,900 --virtual-time-budget=4000 \
    --screenshot="$OUT/v3_$s.png" "$URL?snap#$s" 2>/dev/null
done
"$CHROME" --headless=new --disable-gpu --hide-scrollbars \
  --window-size=390,844 --virtual-time-budget=4000 \
  --screenshot="$OUT/v3_m_hero.png" "$URL?snap" 2>/dev/null
ls -la "$OUT"/v3_*.png

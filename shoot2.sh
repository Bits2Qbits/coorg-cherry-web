#!/bin/bash
# Screenshot each section after forcing in-view + waiting for transitions
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="http://localhost:8931/index.html"
OUT=/tmp/coorg_shots
mkdir -p "$OUT"

# Use a JS-injected page snapshot trick: load with ?snap=SECTION which our page doesn't support,
# so instead load each anchor and use virtual-time to let observers fire.
for s in hero land coffee process people contact; do
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --window-size=1440,900 \
    --virtual-time-budget=3500 \
    --screenshot="$OUT/v2_$s.png" "$URL#$s" 2>/dev/null
done
"$CHROME" --headless=new --disable-gpu --hide-scrollbars \
  --window-size=390,844 --virtual-time-budget=3500 \
  --screenshot="$OUT/v2_m_hero.png" "$URL" 2>/dev/null
ls -la "$OUT"/v2_*.png

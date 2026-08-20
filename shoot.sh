#!/bin/bash
# Screenshot each section at desktop width by scrolling with a fragment + full-page
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="http://localhost:8931/index.html"
OUT=/tmp/coorg_shots
mkdir -p "$OUT"

# Desktop hero
"$CHROME" --headless --disable-gpu --hide-scrollbars \
  --window-size=1440,900 --screenshot="$OUT/s1_hero.png" "$URL" 2>/dev/null

# Section anchors (fragment scrolls to each section)
for s in land coffee process people contact; do
  "$CHROME" --headless --disable-gpu --hide-scrollbars \
    --window-size=1440,900 --screenshot="$OUT/sec_$s.png" "$URL#$s" 2>/dev/null
done

# Mobile hero
"$CHROME" --headless --disable-gpu --hide-scrollbars \
  --window-size=390,844 --screenshot="$OUT/m_hero.png" "$URL" 2>/dev/null

ls -la "$OUT"

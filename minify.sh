#!/bin/bash

# minifies masonry.js
# requires nodejs & uglifyjs

JS=masonry.js
JS_MIN=masonry.min.js

# minify with UglifyJS
# then, add newline characters after `*/`, but not last newline character
uglifyjs $JS \
  | awk '{ORS=""; gsub(/\*\//,"*/\n"); if (NR!=1) print "\n"; print;}' > $JS_MIN
# add trailing semicolon
echo ';' >> $JS_MIN
echo "Minified" $JS "as" $JS_MIN

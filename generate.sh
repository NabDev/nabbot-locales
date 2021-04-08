#!/bin/bash

xgettext \
  --files-from POTFILES.in \
  --add-comments \
  --from-code utf-8 \
  --directory ../ \
  --output nabbot.pot \
  --no-wrap

for locale in */; do
file="$locale/LC_MESSAGES/nabbot"

msgmerge \
  --update \
  --no-fuzzy-matching \
  --backup off \
  "$file.po" \
  nabbot.pot

msgfmt "$file.po" --output-file "$file.mo"; done
#!/bin/bash

xgettext \
  --files-from POTFILES.in \
  --add-comments \
  --from-code utf-8 \
  --directory ../ \
  --no-wrap \
  --output nabbot.pot \

for locale in */; do
file="$locale/LC_MESSAGES/nabbot"

msgmerge \
  --update \
  --no-fuzzy-matching \
  --backup off \
  --no-wrap \
  "$file.po" \
  nabbot.pot

msgfmt "$file.po" --output-file "$file.mo"; done
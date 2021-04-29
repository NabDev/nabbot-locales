#!/bin/bash
echo "Extracting tranaslatable strings..."
xgettext \
  --files-from POTFILES.in \
  --add-comments \
  --from-code utf-8 \
  --directory ../ \
  --no-wrap \
  --keyword=pgettext:1c,2 \
  --keyword=p_:1c,2 \
  --keyword=n_:1,2 \
  --keyword=np_:1c,2,3 \
  --keyword=npgettext:1c,2,3 \
  --output nabbot.pot
echo -e "\tDone"

for locale in */
do
  file="$locale/LC_MESSAGES/nabbot"
  echo "Locale ${locale}"
  echo -e "\tMerging strings..."
  msgmerge \
    --update \
    --no-fuzzy-matching \
    --backup off \
    --no-wrap \
    "$file.po" \
    -v -q \
    nabbot.pot
  echo -e "\t\tDone"

  echo -e "\tCompiling strings..."
  msgfmt "$file.po" --output-file "$file.mo"
  echo -e "\t\tDone"
done
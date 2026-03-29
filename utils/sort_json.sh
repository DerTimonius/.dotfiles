#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_translations_folder>"
  exit 1
fi

TRANSLATIONS_DIR="$1"

if [ ! -d "$TRANSLATIONS_DIR" ]; then
  echo "Error: Directory '$TRANSLATIONS_DIR' not found."
  exit 1
fi

echo "Sorting JSON files by keys in: $TRANSLATIONS_DIR"

find "$TRANSLATIONS_DIR" -type f -name "*.json" -print0 | while IFS= read -r -d $'\0' file; do
  echo "Processing: $file"
  jq --sort-keys . "$file" >"$file.tmp" && mv "$file.tmp" "$file"
  if [ $? -ne 0 ]; then
    echo "Warning: Failed to process '$file'. Original file retained."
    rm -f "$file.tmp"
  fi
done

echo "Sorting complete."

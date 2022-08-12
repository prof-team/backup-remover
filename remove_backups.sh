#!/bin/sh

set -e

echo "[`date +'%Y-%m-%d %H:%M:%S'`]: Removing backup's files started"
echo ""

if [ -z "$COUNT_FILES" ]; then
    COUNT_FILES="10"
fi

echo "   Count files we should leave is $COUNT_FILES"
echo ""

PARAM_FOR_REMOVING=$(($COUNT_FILES + 1))

for name in /backups/*; do
  if [ -d "$name" ] && [ ! -L "$name" ]; then
    cd "$name";
    echo "   Next files are deleting in folder $name:"
    ls -t | tail -n +$PARAM_FOR_REMOVING

    ls -t | tail -n +$PARAM_FOR_REMOVING | xargs -I {} rm {}
  fi
done

echo ""

echo "[`date +'%Y-%m-%d %H:%M:%S'`]: Finished"
echo ""
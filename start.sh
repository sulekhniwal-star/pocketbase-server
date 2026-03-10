#!/bin/sh

# create admin if database is empty
if [ ! -f /pb_data/data.db ]; then
  echo "Creating first admin..."
  ./pocketbase superuser create sulekhniwal@gmail.com Princy@2004
fi

echo "Starting PocketBase..."
exec ./pocketbase serve --http=0.0.0.0:$PORT --dir=/pb_data

# !/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/note/${ID}"
curl "${API}${URL_PATH}" \
--include \
--request POST \
--header "Content-Type: application/JSON" \
--data '{
  "note": {
    "favorites": "'"${FAVORITE}"'",
    "sizes": "'"${SIZES}"'",
    "general": "'"${GENERAL}"'"
  }
}'
# --header "Authorization: Token token=$TOKEN" echo

# !/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/note/${ID}"
curl "${API}${URL_PATH}" \
--include \
--request POST \
--header "Content-Type: application/JSON" \
--data '{
  "note": {
    "favorites": "'"${reading, chocolate with fruit filling, colorful watches, chicos, dressbarn}"'",
    "sizes": "'"${bottoms - 10, tops - medium, shoes - 6.5}"'",
    "general": "'"${she likes to wear blues, she cannot wear any heels}"'"
  }
}'
# --header "Authorization: Token token=$TOKEN" echo

# !/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/note/${ID}"
curl "${API}${URL_PATH}" \
--include \
--request PATCH \
--header "Content-Type: application/JSON" \
--data '{
  "note": {
    "favorites": "'"${reading, chocolate with fruit filling, chicos, dressbarn}"'",
    "sizes": "'"${bottoms - 10, tops - medium, shoes - 6}"'",
    "general": "'"${she likes to wear blues and purples, she cannot wear any heels}"'"
  }
}'
# --header "Authorization: Token token=$TOKEN" echo

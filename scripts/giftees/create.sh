# !/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/giftees"
curl "${API}${URL_PATH}" \
--include \
--request POST \
--header "Content-Type: application/JSON" \
--data '{
  "giftee": {
    "name": "'"${NAME}"'"
  }
}'
# --header "Authorization: Token token=$TOKEN" echo

# !/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/idea/${ID}"
curl "${API}${URL_PATH}" \
--include \
--request POST \
--header "Content-Type: application/JSON" \
--data '{
  "idea": {
    "title": "'"${TITLE}"'",
    "where": "'"${WHERE}"'",
    "price": "'"${PRICE}"'",
    "notes": "'"${NOTES}"'",
    "status": "'"${STATUS}"'"
  }
}'
# --header "Authorization: Token token=$TOKEN" echo

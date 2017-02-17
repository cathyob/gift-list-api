# !/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/idea/${ID}"
curl "${API}${URL_PATH}" \
--include \
--request POST \
--header "Content-Type: application/JSON" \
--data '{
  "idea": {
    "title": "'"${a new book}"'",
    "where": "'"${undecided}"'",
    "price": "'"${20.00}"'",
    "notes": "'"${sci-fi or fantasy?}"'",
    "status": "'"${0}"'"
  }
}'
# --header "Authorization: Token token=$TOKEN" echo

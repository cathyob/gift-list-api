# !/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/idea/${ID}"
curl "${API}${URL_PATH}" \
--include \
--request PATCH \
--header "Content-Type: application/JSON" \
--data '{
  "idea": {
    "title": "'"${an amazon kindle giftcard}"'",
    "where": "'"${amazon.com}"'",
    "price": "'"${50.00}"'",
    "notes": "'"${she can pick her own book}"'",
    "status": "'"${0}"'"
  }
}'
# --header "Authorization: Token token=$TOKEN" echo

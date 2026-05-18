#!/bin/vash
TELEGRAM_BOT_TOKEN="7813991230:AAE9MGH7eWI2C_BKq4qT9yCQJqezeJ0mUqA"
TELEGRAM_USER_ID="769013741"

URL="https://api.telegram.org/bot7813991230:AAE9MGH7eWI2C_BKq4qT9yCQJqezeJ0mUqA/sendMessage"

TEXT="$CI_JOB_STAGE is $CI_JOB_STATUS"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
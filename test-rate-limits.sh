#!/bin/bash
# Test script to demonstrate Kong rate limiting on parking-service API
# Limits: 20 requests/minute per IP

API_URL="https://parkora.crn.si/api/v1/parking/"
echo "Testing rate limits on $API_URL"
echo "Limits: 20 requests/minute per IP"
echo "=========================================="

for i in {1..25}; do
    echo "Request $i:"
    # Get response with headers
    response=$(curl -s -i "$API_URL" | head -20)  # First 20 lines to capture headers and body
    status_line=$(echo "$response" | head -1)
    status_code=$(echo "$status_line" | awk '{print $2}')
    remaining_min=$(echo "$response" | grep -i "x-ratelimit-remaining-minute:" | awk '{print $2}' | tr -d '\r')
    remaining_hour=$(echo "$response" | grep -i "x-ratelimit-remaining-hour:" | awk '{print $2}' | tr -d '\r')
    body=$(echo "$response" | sed -n '/^$/,$p' | tail -5)  # Get body after empty line

    echo "Status: $status_code, Remaining-Min: ${remaining_min:-N/A}, Remaining-Hour: ${remaining_hour:-N/A}"
    if [ "$status_code" = "429" ]; then
        echo "Body: $body"
    fi
    sleep 0.1
done

echo "=========================================="
echo "Expected behavior:"
echo "- Requests 1-20: 200 OK with decreasing remaining counts"
echo "- Requests 21+: 429 Too Many Requests"
echo "- Headers show remaining requests in current windows"
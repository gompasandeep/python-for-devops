#!/bin/bash

# Prompt for the amount and currencies
read -p "Enter the amount: " amount
read -p "Enter the source currency (e.g., USD): " source_currency
read -p "Enter the target currency (e.g., EUR): " target_currency

# Replace 'YOUR_API_KEY' with your actual API key
api_key="47f3958080a65c7827d765a5"

# Use an API to convert currency
conversion_result=$(curl -s "https://v6.exchangerate-api.com/v6/$api_key/pair/$source_currency/$target_currency/$amount")

# Check if the API request was successful
if echo "$conversion_result" | grep -q "error"; then
  echo "Error: $conversion_result"
else
  # Extract the converted amount from the API response
  converted_amount=$(echo "$conversion_result" | jq -r .conversion_result)
  # Display the converted amount
  echo "Converted Amount: $converted_amount $target_currency"
fi


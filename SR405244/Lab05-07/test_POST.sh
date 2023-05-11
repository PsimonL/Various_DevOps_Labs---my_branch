#!/bin/bash

flag=0

test_endpoint() {
  expected_response=$1
  method_type=$2
  actual_response=$(curl -X POST -H "Content-Type: application/json" -d "[5, 1]" http://localhost:3001/$method_type)

  if [ "$actual_response" = "$expected_response" ]; then
    echo "Test status: OK"
    echo "Returned message: $actual_response"
  else
    echo "Test failed: HTTP response code is not 200"
    flag = flag + 1
  fi
}

echo "Testing addition endpoint..."
test_endpoint "6" "add"
echo "flag = $flag"

echo "Testing subtraction endpoint..."
test_endpoint "4" "subtract"
echo "flag = $flag"

echo "Testing multiplication endpoint..."
test_endpoint "5" "multiply"
echo "flag = $flag"

echo "Testing division endpoint..."
test_endpoint "5" "divide"
echo "flag = $flag"
flag=flag+1

if [ flag=0 ]; then
  echo "All tests passed."
  exit 0
else
  echo "Not all tests passed."
  exit 1
fi

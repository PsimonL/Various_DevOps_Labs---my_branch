#!/bin/bash

actual_response=$(curl http://localhost:3001/hello  )
expected_response="Hello, World!"

if [ "$actual_response" = "$expected_response" ]; then
  echo "Test status: OK"
  echo "GET message: $actual_response"
  exit 0
else
  echo "Test status: FAILED"
  exit 1
fi

#!/bin/bash

start_time=$(date +%s)

kubectl apply -f deployment.yaml

deploy_ready=false

while [ "$deploy_ready" = false ]; do
  deployment_status=$(kubectl get deployment go-deploy-pod-lab11 -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')
  
  if [ "$deployment_status" = "True" ]; then
    deploy_ready=true
  else
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
  
    if [ "$elapsed_time" -gt 60 ]; then
      echo "Błąd: Czas wdrożenia przekroczył 60 sekund."
      exit 1
    fi
  
    sleep 1
  fi
done

end_time=$(date +%s)
duration=$((end_time - start_time))

echo "Wdrożenie zakończone pomyślnie."
echo "Czas trwania wdrożenia: $duration sekund."
exit 0

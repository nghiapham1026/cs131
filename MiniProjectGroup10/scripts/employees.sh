#!/bin/bash

# Revenue and Profit per Employee
awk -F, 'NR > 1 {
  # Remove commas, dollar signs, percentage signs, and quotes
  gsub(/[$",]/, "", $3);
  gsub(/[$",]/, "", $5);
  gsub(/[$",]/, "", $10);
  
  if ($10 > 0) { # Avoid division by zero
    revenue_per_employee = $3 / $10;
    profit_per_employee = $5 / $10;
    print $2 " Revenue per Employee: " revenue_per_employee;
    print $2 " Profit per Employee: " profit_per_employee;
  }
}' "./data/Fortune 1000 Companies by Revenue.csv"

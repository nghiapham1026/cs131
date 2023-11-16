#!/bin/bash

# Average Growth Rate for Revenue and Profit Percent Change
awk -F, 'NR > 1 {
  # Remove commas, dollar signs, percentage signs, and quotes, then sum the changes
  gsub(/[$"%,"]/, "", $4); revenue_change_sum += $4;
  gsub(/[$"%,"]/, "", $6); profit_change_sum += $6; 
  count++;
} END {
  print "Average Revenue Percent Change: " revenue_change_sum/count "%";
  print "Average Profit Percent Change: " profit_change_sum/count "%";
}' "./data/Fortune 1000 Companies by Revenue.csv"

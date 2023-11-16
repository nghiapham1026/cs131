#!/bin/bash

# Profit Margin and Asset Turnover
awk -F, 'NR > 1 {
  # Remove commas, dollar signs, percentage signs, and quotes
  gsub(/[$",]/, "", $3);
  gsub(/[$",]/, "", $5);
  gsub(/[$",]/, "", $7);
  
  if ($3 > 0 && $7 > 0) { # Avoid division by zero
    profit_margin = ($5 / $3) * 100;
    asset_turnover = $3 / $7;
    print $2 " Profit Margin: " profit_margin "%";
    print $2 " Asset Turnover: " asset_turnover;
  }
}' "./data/Fortune 1000 Companies by Revenue.csv"

#sed -i -e 's/\r$//' ./scripts/margin_assets.sh
#./scripts/margin_assets.sh
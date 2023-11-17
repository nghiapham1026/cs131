#!/bin/bash

# Path to the CSV file
file_path="./data/Fortune 1000 Companies by Revenue.csv"

# Use Python to calculate the correlation
python - <<EOF
import pandas as pd

df = pd.read_csv("$file_path")
df['profits_percent_change'] = df['profits_percent_change'].replace('[\%,]', '', regex=True).astype(float)
df['market_value'] = df['market_value'].replace('[\$,]', '', regex=True).astype(float)
correlation = df['profits_percent_change'].corr(df['market_value'])
print(f"Correlation between Profits Percent Change and Market Value: {correlation}")
EOF

#chmod +x ./scripts/nontrivial/correlation_profit_change_market_value.sh
#./scripts/nontrivial/correlation_profit_change_market_value.sh
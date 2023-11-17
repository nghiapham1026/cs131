#!/bin/bash

# Path to the CSV file
file_path="./data/Fortune 1000 Companies by Revenue.csv"

# Use Python to calculate the correlation
python - <<EOF
import pandas as pd

df = pd.read_csv("$file_path")
df['revenues'] = df['revenues'].replace('[\$,]', '', regex=True).astype(float)
df['profits'] = df['profits'].replace('[\$,]', '', regex=True).astype(float)
correlation = df['revenues'].corr(df['profits'])
print(f"Correlation between Revenues and Profits: {correlation}")
EOF

#chmod +x ./scripts/nontrivial/correlation_revenue_profit.sh
#./scripts/nontrivial/correlation_revenue_profit.sh
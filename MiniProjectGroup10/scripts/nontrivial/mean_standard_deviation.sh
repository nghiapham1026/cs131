#!/bin/bash

# Path to the CSV file
file_path="./data/Fortune 1000 Companies by Revenue.csv"

# Use Python to calculate mean and standard deviation
python3 - <<EOF
import pandas as pd

# Function to convert currency strings to floats
def convert_currency(val):
    if isinstance(val, str):
        val = val.replace(',', '').replace('$', '').replace('(', '-').replace(')', '')
        try:
            return float(val)
        except ValueError:
            return None
    return val

# Read the CSV file
df = pd.read_csv("$file_path")

# Clean the 'revenues' and 'profits' columns and convert to float
df['revenues '] = df['revenues '].apply(convert_currency)
df['profits '] = df['profits '].apply(convert_currency)

# Calculate the mean and standard deviation
revenues_mean = df['revenues '].mean()
revenues_std = df['revenues '].std()
profits_mean = df['profits '].mean()
profits_std = df['profits '].std()

print(f"Mean of Revenues: {revenues_mean}")
print(f"Standard Deviation of Revenues: {revenues_std}")
print(f"Mean of Profits: {profits_mean}")
print(f"Standard Deviation of Profits: {profits_std}")
EOF

#./scripts/nontrivial/mean_standard_deviation.sh
# ==========================================================
# Simple Interest Calculator
# ----------------------------------------------------------
# This script calculates simple interest based on user input.
# Formula used:
#     Simple Interest = (Principal × Rate × Time) / 100
#
# Inputs:
#   - Principal Amount
#   - Annual Interest Rate (%)
#   - Time Period (years)
#
# Author: Project Contributors
# ==========================================================

echo "======================================"
echo "        Simple Interest Calculator"
echo "======================================"

# Function to check if input is a valid number
is_number() {
    [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]
}

# Read Principal
read -p "Enter the principal amount: " principal
if ! is_number "$principal"; then
    echo "Error: Principal must be a numeric value."
    exit 1
fi

# Read Interest Rate
read -p "Enter the annual interest rate (%): " rate
if ! is_number "$rate"; then
    echo "Error: Interest rate must be a numeric value."
    exit 1
fi

# Read Time Period
read -p "Enter the time period (years): " time
if ! is_number "$time"; then
    echo "Error: Time period must be a numeric value."
    exit 1
fi

# Calculate Simple Interest
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
total=$(echo "scale=2; $principal + $interest" | bc)

# Display Results
echo ""
echo "------------- Result -----------------"
echo "Principal Amount : $principal"
echo "Interest Rate    : $rate %"
echo "Time Period      : $time years"
echo "--------------------------------------"
echo "Simple Interest  : $interest"
echo "Total Amount     : $total"
echo "======================================"

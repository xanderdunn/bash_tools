from datetime import datetime

# Define the target date
target_date = datetime(2027, 8, 19)

# Get today's date
today = datetime.today()

# Calculate the difference in days
days_until_target = (target_date - today).days

# Print the number of days
print(f"Days to go: {days_until_target}")

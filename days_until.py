from datetime import datetime

# Define the target date
# This is 2 years after I started at Periodic
target_date = datetime(2027, 5, 12)

# Get today's date
today = datetime.today()

# Calculate the difference in days
days_until_target = (target_date - today).days

# Print the number of days
print(f"Days to go: {days_until_target}")

# It only counts as a vacation if it's rejuvenating,
# working for the next job does not count, and if I
# go somewhere, staying at home doesn't count. Change
# of environment is important. Not sick. A three day
# weekend doesn't count, it's too short.
last_vacation = datetime(2025, 3, 19)
days_since_vacation = (today - last_vacation).days
print(f"Days since vacation: {days_since_vacation}")
if days_since_vacation > 90:
    print("Go on vacation!")

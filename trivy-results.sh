#!/bin/sh

# Set the absolute path to scan.txt
scan_file="/var/lib/jenkins/workspace/java-devopd-project/scan.txt"

# Check if scan.txt exists
if [ ! -f "$scan_file" ]; then
  echo "Error: $scan_file not found."
  exit 1
fi

# Variables to store the image name and vulnerability counts
image_name=""
vulnerability_info=""

# Read scan.txt and process the results
while IFS= read -r line; do
  # Check if the line contains "Target:"
  if [[ "$line" == "Target:"* ]]; then
    image_name=$(echo "$line" | cut d ':' -f2 | tr -d '[:space:]')
  fi

  # Check if the line contains vulnerability counts
  if [[ "$line" == "Total:"* ]]; then
    vulnerability_info="$line"
    break
  fi
done < "$scan_file"

# Display the output
echo "$image_name"
echo "====================================="
echo "$vulnerability_info"
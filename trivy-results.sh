#!/bin/sh

# Set the absolute path to the scan file using the Jenkins BUILD_NUMBER
scan_file="/var/lib/jenkins/workspace/Java-Pipeline-App/scan-${BUILD_NUMBER}.txt"

# Check if scan file for the current build exists
if [ ! -f "$scan_file" ]; then
  echo "Error: $scan_file not found for build ${BUILD_NUMBER}."
  exit 1
fi

# Variables to store the image name and vulnerability counts
image_name=""
vulnerability_info=""

# Read scan file and process the results
while IFS= read -r line; do
  # Check if the line contains "Target:"
  if [[ "$line" == "Target:"* ]]; then
    image_name=$(echo "$line" | cut -d ':' -f2 | tr -d '[:space:]')
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

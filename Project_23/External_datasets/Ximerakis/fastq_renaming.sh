#!/usr/bin/bash

for folder in $(cat Ximerakis_BAM_names.txt) ; do
	master_folder=$folder
	# Find the files with the pattern "bamtofastq*" within the master folder
    	files=$(find "$master_folder" -maxdepth 2 -name "bamtofastq*" -print)
    
    	# Iterate through the files
    	for file in $files; do
        	# Extract the base name of the file
	        base_name=$(basename "$file")
        
        	# Extract the suffix of the base name starting from the 7th character
	        suffix="${base_name:10}"

        	# Construct the new name by prepending foldername to the extracted suffix
	        new_name="${master_folder}${suffix}"
        
        	# Rename the file
	        mv "$file" "$(dirname "$file")/${new_name}"
	done
done

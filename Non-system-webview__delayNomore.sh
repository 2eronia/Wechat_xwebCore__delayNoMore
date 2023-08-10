#!/system/bin/sh


# Define a function that takes one argument as a directory
clean_webview_libs() {
	# Search for all files that start with lib and contain webview in the directory
	find "$1" -type f -iname "lib*webview*.so*" | while read file; do
		# Get the file size (in bytes)
		size=$(stat -c %s "$file")
		# If the file is larger than 9.3MB (9.3 * 1024 * 1024 = 9751756.8 bytes)
		if [ $size -gt 9751757 ]; then
			# Perform the following actions on the file
			# chattr -i "$file" # Remove the immutable attribute
			echo -n "" > "$file" # Clear the file content
			# chattr +i "$file" # Add the immutable attribute
			echo "chattr status: $(lsattr "$file")" # Print the file attribute status
		fi
	done
}

# Call the function, passing in directories
clean_webview_libs /data/data
clean_webview_libs /data/user/999

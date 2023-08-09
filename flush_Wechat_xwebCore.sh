#!/system/bin/sh
# This script intends to make the libxwebcore.so an empty file in WeChat then make it immutable
# Then WeChat will properly render correctly with the system webview but not its own modified version

clear_libxwebcore() {
	# Get the destination directory
	path=$1

	# Find all directories start with "app_xwalk_" in the path
	for dir in $(find "$path" -type d -maxdepth 1 -name 'app_xwalk_*'); do
		# Find all files named libxwebcore.so in the subdirectory /extracted_xwalkcore
		for file in $(find "$dir/extracted_xwalkcore" -type f -maxdepth 1 -name 'libxwebcore.so'); do
			chattr -i "$file" # Make sure the file to be editable
			echo -n "" > "$file" # Clear the file contents
			chattr +i "$file" # Set the file to be immutable
			echo "chattr status: $(lsattr "$file")" # Print the file's chattr status
		done
	done

	# Find all directories start with "xweb_" in the app_xweb_data subdirectory of the path.
	for dir in $(find "$path/app_xweb_data" -type d -maxdepth 1 -name 'xweb_*'); do
		# Find all files named libxwebcore.so in the subdirectory /extracted_xwalkcore
		for file in $(find "$dir/extracted_xwalkcore" -type f -maxdepth 1 -name 'libxwebcore.so'); do
			chattr -i "$file"
			echo -n "" > "$file"
			chattr +i "$file"
			echo "chattr status: $(lsattr "$file")"
		done
	done
}

# pass in the directories
clear_libxwebcore "/data/data/com.tencent.mm/"
clear_libxwebcore "/data/user/999/com.tencent.mm/"

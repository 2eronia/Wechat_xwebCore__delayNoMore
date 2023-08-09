#!/system/bin/sh


clear_libxwebcore() {
	path=$1
	find "$path" -type d -maxdepth 1 -name 'app_xwalk_*' | while read dir
	do
		find "$dir/extracted_xwalkcore" -type f -maxdepth 1 -name 'libxwebcore.so' | while read file
		do
			chattr -i "$file"
			echo -n "" > "$file"
			chattr +i "$file"
			echo "chattr status: $(lsattr "$file")"
		done
	done

	find "$path/app_xweb_data" -type d -maxdepth 1 -name 'xweb_*' | while read dir
	do
		find "$dir/extracted_xwalkcore" -type f -maxdepth 1 -name 'libxwebcore.so' | while read file
		do
			chattr -i "$file"
			echo -n "" > "$file"
			chattr +i "$file"
			echo "chattr status: $(lsattr "$file")"
		done
	done
}

clear_libxwebcore "/data/data/com.tencent.mm/"
clear_libxwebcore "/data/user/999/com.tencent.mm/"

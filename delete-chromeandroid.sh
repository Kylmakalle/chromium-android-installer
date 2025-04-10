#! /bin/sh

set -u

if [ $# -lt 1 ]
then
	echo "Uninstalling org.chromium.chrome.{content_shell_apk} and wiping data and cache directories" >&2
	adb shell pm uninstall -k org.chromium.chrome      || { echo "FATAL: Uninstalling previous version failed: org.chromium.chrome"; exit 1; }
	adb shell pm uninstall -k org.chromium.content_shell_apk || { echo "FATAL: Uninstalling previous version failed: org.chromium.content_shell_apk"; exit 1; }    
	exit
fi

while getopts "k" opt; do
	case $opt in
		k)
			echo "Uninstalling org.chromium.chrome, keeping data and cache directories" >&2
			adb shell pm uninstall -k org.chromium.chrome      || { echo "Uninstall failed: org.chromium.chrome"; exit 1; }
			echo "Uninstalling org.chromium.chrome.content_shell_apk, keeping data and cache directories" >&2
			adb shell pm uninstall -k org.chromium.content_shell_apk || { echo "Uninstall failed: org.chromium.content_shell_apk"; exit 1; }
			;;
		*)
			echo "Usage: $0 [-k]" >&2
			exit 1
			;;
	esac
done


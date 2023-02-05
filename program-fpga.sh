#!/bin/bash

# This script should be put at the home directory of the Zedboard.

if [ $# -ne 1 ]; then
	echo "Usage: $0 <bistream>"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "File $1 does not exist"
	exit 1
fi

filename=$(basename -- "$1") &&
	sudo cp "$1" /lib/firmware &&
	sudo bash -c "echo $filename > /sys/class/fpga_manager/fpga0/firmware" &&
	echo "FPGA programmed with $1."

#!/bin/bash
#Remote Operations Management Assistant
# title         :data
# description   :Data connection checking of RomaV4.
# author        :Louay Serhal
# created       :2024-2-8
# version       :4.0
# usage         :Collect data
# bash_version  :5.2.21(1)-release (x86_64-pc-linux-gnu)
# =========================================================================================================================================================
#include colors
source colors.sh
#include connection
source connection.sh

#check connection
if [ $connected -eq 1 ]; then
	host_name="$(hostname)"
        system="$(uname)"
        ip_address="$(hostname -I)"
        interface="$(ip -o -4 route show to default | awk '{print $5}')"
        subnet_mask="$(ifconfig ${interface} | grep -oP 'netmask \K\S+')"
        mac_address="$(ifconfig ${interface} | awk '/ether/ {print $2}')"
        subnet_cidr="$(ifconfig ${interface} | awk '/netmask/ {split($4, a, "."); bits=0; for (i in a) bits+=int(log(256-a[i])/log(2)); print 32-bits}')"


	echo -e "${color_green}${host_name}${color_none}-${color_red}${system}${color_none}"

	#print logo
	source logo.sh
	echo -e "IP address: ${color_green}${ip_address}${color_none}/${color_green}${subnet_cidr}${color_none}"
	echo -e "Mac address: ${color_green}${mac_address}${color_none}"
else
	echo -e "${color_red}Requirements${color_none} for ${color_green}ROMAv4${color_none}:"
	echo -e ".Runs on Unix-based Systems"
	echo -e ".Supports IPv${color_green}4${color_none} addresses."
	echo -e ".Check your internet connection"
	source logo.sh
fi

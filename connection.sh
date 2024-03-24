#!/bin/bash
#Remote Operations Management Assistant
# title         :connection
# description   :Internet connection checking of RomaV4.
# author        :Louay Serhal
# created       :2024-2-8
# version       :4.0
# usage         :check connection
# bash_version  :5.2.21(1)-release (x86_64-pc-linux-gnu)
# =========================================================================================================================================================
#check internet connection and ipv4 usage

if ping -c 1 1.1.1.1 > /dev/null 2>&1 && ifconfig | grep -q "inet .*netmask .*broadcast"; then
      connected=1
else
      connected=0
fi


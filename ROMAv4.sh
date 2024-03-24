#!/bin/bash
#Remote Operations Management Assistant
# title         :Main
# description   :This script will execute ROMAv4.
# author        :Louay Serhal
# created       :2024-2-8
# version       :4.0
# usage         :Main
# bash_version  :5.2.21(1)-release (x86_64-pc-linux-gnu)
# =========================================================================================================================================================
if [ -z "$EXECUTED" ]; then
        export EXECUTED="true"
        exec gnome-terminal -- bash -c "$0; exec bash"
fi
source data.sh

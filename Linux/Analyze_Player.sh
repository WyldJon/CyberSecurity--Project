#!/bin/bash
echo "Mylie Schmidt played at the following times" >> Notes_Player_Analysis
awk -F" " '{print $1}' $1 >> Notes_Player_Analysis
echo "For a total of" >> Notes_Player_Analysis
grep -i "Mylie Schmidt" $1 | wc -l >> Notes_Player_Analysis

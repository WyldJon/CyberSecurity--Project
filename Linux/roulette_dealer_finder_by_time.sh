#1/bin/bash
grep -i "$2" $1_Dealer_schedule | awk -F" " '{print $5, $6}'


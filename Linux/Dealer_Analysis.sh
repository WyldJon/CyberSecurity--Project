#!/bin/bash
grep "-" /home/sysadmin/Week_3_Homework/Lucky_Duck_Ivestigations/Roulette_Loss_Investigation/Player_Analysis/$1_win_loss_player_data | awk -F" " '{print $1, $2}' > Dealer_temp
echo "Date: " $1 >> Dealer_working_during_losses
grep -f Dealer_temp $1_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' >> Dealer_working_during_losses
rm Dealer_temp
 


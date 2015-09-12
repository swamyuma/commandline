# Warn via email if user is over 50% of quota
# I got most of this code from somewhere long time back and I don't have that information! This is for my reference.
# This script can be included in a crobjob to run everyday

# get current usage
CURR_USG=` quota | tail -1| cut -d" " -f19`;

# calcualte the usage as a percentages
PERCENTAGE=`echo "($CURR_USG/100000)*100"| bc -l`;

# if usage exceeds 90%, send out an email to the user
if [ "$PERCENTAGE" \> "90" ]; 
then
    MESSAGE="Your quota on home is getting close to full: $PERCENTAGE %";
    EMAIL="user@example.com";
    SUBJECT="Quota Warning: $PERCENTAGE % full";
    echo $MESSAGE | /bin/mail -s "$SUBJECT" "$EMAIL"
    echo 'echo $MESSAGE | /bin/mail -s "$SUBJECT" "$EMAIL" '
fi;

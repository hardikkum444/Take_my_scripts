usrName="mandom"
pass="123"

read -p "enter username -> " u
read -p "enter password -> " p

if [ "$usrName" = "$u" ] && [ "$pass" = "$p" ]; then
    echo "correct"
else
    echo "incorrect"
fi




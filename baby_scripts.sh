#!/bin/bash

add()
{
	local sum=$(($1+$2))
	echo "sum of $1 and $2 is $sum"
}

prime(){

	local temp=$(($1/2))
	local temp1=0

	for ((i=2;i<=temp;i++)); do
		if [ $(($1%i)) -eq 0 ]; then
		temp1=$((temp1+1))
		fi
	done

	if [ $temp1 -eq 0 ]; then
		echo "number is prime"
	else
		echo "Number aint prime"
	fi
}

reverse(){

	local ones=$(( $1%10 ))
	local tens=$(( ($1%100 -ones) / 10))
	local hundreds=$(( ($1-tens*10 - ones)/100))

	local final=$((ones*100+tens*10+hundreds))

	echo "youre new number is $final"


}

echo "give two numbers"

read -p "enter first number " n1
read -p "enter second number " n2

add n1 n2

read -p "enter number " n3

prime n3

read -p "enter a three digit number" n4

reverse n4


#!/bin/bash

fib() {

	n=$1
	a=0
	b=1

	echo -n "$a "
	for ((i = 1; i < n; i++)); do
		echo -n "$b "
		temp=$b
		b=$((a + b))
		a=$temp
	done
	echo
}

add() {

	local sum=0
	local num=$1
	for ((i = 0; i <= num; i++)); do
		sum=$((sum + i))
	done

	echo "and the sum of numbers till " $num "is--> " $sum

}

read -p "enter number for fib: " num1
fib num1

read -p "enter number for adding: " num2
add $num2

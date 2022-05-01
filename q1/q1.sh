#!/bin/bash

echo "The shell name is $BASH"
echo "The shell version is $BASH_VERSION"
echo "Home directory is $HOME"
echo "Current working directory is $PWD"
echo "----------------------------"
echo "Number of arguments is $#"  #I've written in the terminal ./question.sh 5 + 420 q1.sh pwd df ls ps and got the correct result

echo "----------------------------"
array1=("$@")
echo "array1 size is ${#array1[@]}"
echo "array1 is [${array1[@]}]"
echo "----------------------------"
array2=("$5" "$6" "$7" "$8")
echo "array2 size is ${#array2[@]}"
echo "array2 is [${array2[@]}]"
echo "----------------------------"
echo "Please choose an index of array2 to remove an element"
read inputOfArray2
echo "Choice is $inputOfArray2"
unset array2[$inputOfArray2]
echo "Array2 after removing element at index $inputOfArray2 is [${array2[@]}]"
echo "After removing element at index $inputOfArray2 array2 size is ${#array2[@]}"
echo "----------------------------"
factorial()
{
	if (( $1 <= 1 )); then
		echo 1
	else
		last=$(factorial $(( $1 - 1 )))
		echo $(( $1 * last ))
	fi
}

GLOBAL=$(factorial "${array1[0]}")

echo "The result of 5 is $GLOBAL"
echo "----------------------------"
OPERATOR=${array1[1]}
result=0
numOfFirstParamater=$GLOBAL
numOfSecondParameter=${array1[2]}

if [[ $OPERATOR = "+" ]]; then
	result=$((numOfFirstParamater+numOfSecondParameter))
	echo "The result of $numOfFirstParamater +  $numOfSecondParameter is $result"
	
elif [[ $OPERATOR = "-" ]]; then
	result=$((numOfFirstParamater-numOfSecondParameter))
	echo "The result of $numOfFirstParamater -  $numOfSecondParameter is $result"
elif [[ $OPERATOR = "*" ]]; then
	result=$((numOfFirstParamater*numOfSecondParameter))
	echo "The result of $numOfFirstParamater *  $numOfSecondParameter is $result"
	
elif [[ $OPERATOR = "/" ]]; then
	result=$((numOfFirstParamater/numOfSecondParameter))
	echo "The result of $numOfFirstParamater /  $numOfSecondParameter is $result"
	
elif [[ $OPERATOR = "%" ]]; then
	result=$((numOfFirstParamater%numOfSecondParameter))
	echo "The result of $numOfFirstParamater %  $numOfSecondParameter is $result"
else	
	echo " Error! You've entered the wrong operator."
	
fi
echo "----------------------------"
fileName="${array1[3]}"
if [[ -f "$fileName" ]]; then
	echo "$fileName file found"
else
	echo "$fileName does not exist."
fi
echo "----------------------------"
echo "--------------pwd--------------"
${array2[0]}
echo "--------------ls--------------"
${array2[2]}
echo "--------------ps--------------"
${array2[3]}


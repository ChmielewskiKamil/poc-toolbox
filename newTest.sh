#!/bin/bash

num=0
for file in test/*.sol; do
    base=$(basename "$file" .sol)
    prefix="${base%%_*}"
    if [[ $prefix =~ ^[0-9]+$ ]]; then
        new_num=$((10#$prefix))
        if ((new_num > num)); then
            num=$new_num
        fi
    fi
done
num=$((num + 1))

# Convert num to three-digit format with leading zeros
num=$(printf "%03d" $num)

if [[ $1 ]] ; then
    newTest=$1
else
    # get input for new test
    echo "Enter name of new test: "
    read newTest
fi

# Replace spaces with _
newTest=${newTest// /_}
newfile="test/${num}_${newTest}.t.sol"

cat test/000_Template.t.sol \
  | sed "s/TestX/Test$num/g" \
  | sed "s/test_X/test_$newTest/g" \
  > $newfile

echo
echo New test created: ${newTest}
echo
echo "To run tests:"
echo "forge test --mc Test${num}"

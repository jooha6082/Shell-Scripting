#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out
git push >> .local.git.out || echo


#Your code here
#for password in $(cat < $1 ); do
#count=1
#while [ $count -lt 5 ]; do
#file="passwords.txt"
password=$(cat < $1)
#for password in $passwords; do
#echo "$password"
score=0

if [ ${#password} -lt 6 ] || [ ${#password} -gt 32 ]; then
  echo "Error: Password length invalid.";

else

  let score=score+${#password}
#    echo "\nafter length: $score\n"

  if egrep -q [#$+%@] <<<  $password; then
    let score=score+5
  fi
   # echo "\n$1"
 #   echo "\nafter special: $score\n"

  if egrep -q [0-9] <<<  $password; then
    let score=score+5
  fi
  #  echo "\nafter nums: $score\n"

  if egrep -q [A-Za-z] <<<  $password; then
    let score=score+5
  fi
   #echo "\nafter alphs: $score\n"

  if egrep -q "([A-Za-z0-9])\1+" <<<  $password; then
    let score=score-10
  fi
    #echo "\nafter alhpnum: $score\n"

  if egrep -q [a-z][a-z][a-z] <<<  $password; then
    let score=score-3
  fi
   # echo "\nafter lowercase: $score\n"

  if egrep -q [A-Z][A-Z][A-Z] <<<  $password; then
    let score=score-3
  fi
   # echo "\nafter capitals: $score\n"

  if egrep -q [0-9][0-9][0-9] <<<  $password; then
    let score=score-3
  fi
   # echo "\nafter repeatnums: $score\n"

  echo "Password Score: $score"

fi

#done

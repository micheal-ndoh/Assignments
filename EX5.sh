#!/bin/bash
echo "A Simple Calculator"


echo "Pick a Number to choose a operator"
echo "1. +"
echo "2. -"
echo "3. *"
echo "4. /"
echo "Exit"

# Read user choice
read CHOICE

case $CHOICE in
  1)
    echo "Enter numbers to add:"
    read NUMBERS
    echo "$NUMBERS" | bc
    ;;
  2)
    echo "Enter numbers to subtract:"
    read NUMBERS
    echo "$NUMBERS" | bc
    ;;
 3)
    echo "Enter numbers to multiply:"
    read NUMBERS
    echo "$NUMBERS" | bc
    ;;
  4)
    echo "Enter numbers to divide:"
    read NUMBERS
    echo "$NUMBERS" | bc
    ;;
  Exit)
    exit 0
    ;;
esac


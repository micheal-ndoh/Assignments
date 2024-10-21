!/bin/bash

# Set task file
TASK_FILE="Task.txt"

# Display menu
echo "To-Do List Manager"
echo "-----------------"
echo "1. Add task"
echo "2. Edit task"
echo "3. View tasks"
echo "4. Delete"
echo "5. Exit"
read CHOICE

case $CHOICE in
  1)
    echo "Enter task:"
    read TASK
    echo "$TASK" >> "$TASK_FILE"
    ;;
  2)
    echo "Enter task you want to Edit:"
    read TASK_NUM
    read -p "Task you wish to replace with" new
    sed -i "s/$TASK_NUM/$new/" $TASK_FILE
    ;;
  3)
    cat "$TASK_FILE"
    ;;
  4) echo " Enter task you want to remove:"
   read  TASK_NUM
   sed -i "$TASK_NUM d" $TASK_FILE
   ;; 
  
  5)
    exit 0
    ;;
esac


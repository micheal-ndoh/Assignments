#!/bin/bash
# Set task file
TASK_FILE="Task.txt"
LOG_FILE="task_log.txt"
usage() {
# Display menu
echo "To-Do List Manager"
echo "-----------------"
echo "1. Add task"
echo "2. Edit task"
echo "3. View tasks"
echo "4. Delete a task"
echo "5. Exit"
echo "6. View_log"
echo "7. Clear logs"
echo "8. clear Tasks"
echo "9. Reset System"
echo "10. Status"
}
todo() {
read -p "Choose an option:" CHOICE


case $CHOICE in
  1)
    echo "Enter task:"
    read TASK
    echo "$TASK" >> "$TASK_FILE"
     echo "Task Added"
    #for log file
     echo "$(date)--You added a task: $TASK " >> $LOG_FILE 
       read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage 
         todo
       fi
 ;;

  2)
    echo "Enter task you want to Edit:"
    read word
      read -p "Task you wish to replace with" new
    sed -i  "s/$word/$new/" $TASK_FILE
 echo "Task Modified"
   echo "$(date)-- You edited $word to $new " >> $LOG_FILE

       read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage
         todo
       fi
  ;;

  3)
    cat -n "$TASK_FILE"
      read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage
         todo
       fi
    ;;

  4)
 echo "Enter the number of the task you want to remove:"    
   read  TASK_NUM
   sed -i "$TASK_NUM d" $TASK_FILE
 echo "Task number $TASK_NUM deleted"
  echo "$(date)--You deleted task $TASK_NUM " >> $LOG_FILE

    read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage 
         todo
       fi
 ;;

  5)
    exit 0
    ;;
  6) 
    echo "Actiiviies/Task log"
    echo "-------------------"
   
       cat -n "$LOG_FILE"
            read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage 
         todo
       fi 
    ;;

 7)
   read -p "Do you really wish to clear your activities?[Y/N]:" Ans
   if [ "$Ans" = 'Y' ]; then
     rm "$LOG_FILE" 
       else 
       echo "Ok request Cancelled"
   fi  
    
    read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage 
         todo
       fi    

 ;; 

 8) 
    read -p "Do you wish to clear a tasks? [Y/N]:" Ans
   if [ "$Ans" = 'Y' ]; then
     rm "$TASK_FILE" 
     echo "Operation Completed"
       else 
       echo "Ok wish Cancelled"
   fi  
    
    read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage 
         todo
       fi    

 ;; 
 
9) 
    read -p "Do you which to reset the system? [Y/N]:" Ans
   if [ "$Ans" = 'Y' ]; then
     rm "$TASK_FILE" "$LOG_FILE" 
     echo "reset Completed"
       else 
       echo "Ok wish Cancelled"
   fi  
    
    read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
        usage 
         todo
        fi    

 ;; 

  *) echo "Invalid Input, You are left with 3 attempt"
   read -p "Enter r to refresh: " r
        if [ "$r" = 'r' ]; then
         usage 
         todo
       fi
   ;;
esac
 }
usage
todo

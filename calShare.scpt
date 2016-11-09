#!/usr/bin/osascript

  tell application "calendar"
    set theCalendars to title of every calendar  
    set theEventsStartdate to start date of every event of calendar (item 2 of theCalendars) whose start date is greater than or equal to (current date)
    set theEventsEnddate to end date of every event of calendar (item 2 of theCalendars) whose start date is greater than or equal to (current date) 

    set counter to 0 
    repeat with i in theEventsStartdate 
      set counter to counter+1
      tell calendar "U" 
        make new event at end with properties {description:" " , summary:"U", location:"", start date:(item counter of theEventsStartdate), end date:(item counter of theEventsEnddate), allday event:false} 
      end tell   
    end repeat
end tell

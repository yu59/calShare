#!/usr/bin/osascript

tell application "calendar"
  set theCalendars to title of every calendar ¬
    whose title is not "U" ¬
    and title is not "日本の祝日" ¬
    and title is not "Birthdays" ¬
    and title is not "琉球大学情報工学科学年歴" ¬
    and title is not "The University" ¬
    and title is not "Found in Mail" ¬
    and title is not "Family"

  repeat with theCalendar in theCalendars

    set theEventsStartdate to start date of every event of calendar theCalendar ¬
      whose start date is greater than or equal to (current date)

    set theEventsEnddate to end date of every event of calendar theCalendar ¬
      whose start date is greater than or equal to (current date) 

    set theEventsAllday to allday event of every event of calendar theCalendar ¬
      whose start date is greater than or equal to (current date) 

    set counter to 0 
    repeat with i in theEventsStartdate 
      set counter to counter+1

      tell calendar "U" 
        make new event at end with properties ¬
        { ¬
          description:" " , ¬
          summary:"U", ¬
          location:"", ¬
          start date:(item counter of theEventsStartdate), ¬
          end date:(item counter of theEventsEnddate), ¬
          allday event: (item counter of theEventsAllday) ¬
        } 
      end tell   

    end repeat
  end repeat
end tell

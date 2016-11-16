#!/usr/bin/osascript

tell application "calendar"
  set theCalendars to title of every calendar ¬
    whose title is not "U" ¬
    and title is not "日本の祝日" ¬
    and title is not "Birthdays" ¬
    and title is not "琉球大学情報工学科学年歴" ¬
    and title is not "The University" ¬
    and title is not "Found in Mail" ¬
    and title is not "Family"¬
    and title is not "Ryuki"

  repeat with theCalendar in theCalendars

    set theEventsUid to uid of every event of calendar theCalendar¬
      whose start date is greater than or equal to (current date)

    repeat with theEventID in theEventsUid 

      set theEventStartDate to (start date of every event ¬
        of calendar theCalendar whose uid is theEventID)

      set theEventEndDate to (end date of every event¬
        of calendar theCalendar whose uid is theEventID) 

      set theEventAllday to (allday event of every event¬
        of calendar theCalendar whose uid is theEventID )

      tell calendar "U" 
        make new event at end with properties ¬
        { ¬
          description:" " , ¬
          summary:"U", ¬
          location:"", ¬
          start date: theEventStartDate, ¬
          end date: theEventEndDate,¬
          allday event: theEventAllday¬ 
        } 
      end tell   

    end repeat
    theCalendars
  end repeat
end tell

# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application- User is able to interact with a menu that contains a list of events.
- [x] Pull data from an external source- I scraped get-offline.com and scraped their events page to pull their data and use it in my CLI.
- [x] Implement both list and detail views- #list_events is in the CLI class.  In the method, there is an instance variable @events that is set equal to an object called Event, that has a class method upcoming.  This allows #list_events to list all of the upcoming events on get-offline.com.
The user is able to get more details by inputting a number associated with a specific event.
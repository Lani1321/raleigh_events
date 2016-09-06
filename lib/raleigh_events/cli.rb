# CLI controller
class RaleighEvents::CLI

  # Call method will greet the user then list all of the events
  # User will see a menu to learn more info about a particular event
  def call 
    list_events
    menu
    goodbye
  end

  def list_events
    puts "Upcoming events in Raleigh:"

    # Theres an object called Event that has a class method #upcoming that returns these events
    @events = RaleighEvents::Event.upcoming 
    
    @events.each.with_index(1) do |event, i|
      puts "#{i}. #{event.title}"
    end
  end

  # Interactive with the user, showing the list of events
  def menu 

    # Need to instantiate a new variable so my while loop doesn't break
    input = nil   
    while input != "exit"
      puts "Enter the number of the event you'd like more info on or type list to see the events again or type exit: "
      input = gets.strip.downcase
      puts "\n"
      # Strings that are integers will convert to 0, if its an actual integer then it will be greater than 0
      if input.to_i > 0           
        # Want the array index of this event
        the_event = @events[input.to_i-1]  
        puts "Event: " "#{the_event.title} \n" "When: " "#{the_event.date} \n" "Venue: " "#{the_event.location} \n" "More Info: " "#{the_event.url}"  #reading out of these objescts, instead of hard coding into strings
      elsif input == "list"
        list_events
      else 
        puts "Not sure what you want, type list or exit."
      end
    end
  end
 
  def goodbye
    puts "See you tomorrow for more events!!!"
  end
end
class RaleighEvents::Event
  attr_accessor :title, :date, :location, :url

  # Scrape get-offline and return events based on that data
  def self.upcoming
    self.scrape_events
  end

    def self.scrape_events
      events = []
      doc = Nokogiri::HTML(open("https://www.get-offline.com/raleigh/upcoming-events"))
     
      doc.css(".experience-thumb").each do |event|
        # instantiating a new Event object as it iterates through each web element
        new_event = self.new  
        
        location = event.css(".location-bar").text.gsub("â\u0080¢", "").strip
       
        # Puts every string into an array and removed the last unwanted value
        location_array = location.split(/\s+(?=(?:[^"]*"[^"]*")*[^"]*$)/)
        location_array.pop
        date = event.css(".experience-extra-details").children.last.text 

        # Setting the attributes of Event instance 
        new_event.date     = date.gsub(/\n/, "").strip
        new_event.title    = event.css("#template-name-link").text.strip
        new_event.url      =  "https://www.get-offline.com#{event.attribute('href')}"
        new_event.location = location_array.join(' ')

        events << new_event
      end
      events
    end

end

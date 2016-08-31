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
        new_event.title = event.css("#template-name-link").text.strip

        location = event.css(".location-bar").text.gsub("â\u0080¢", "").strip
        location_array = location.split(/\s+(?=(?:[^"]*"[^"]*")*[^"]*$)/)
        location_array.pop
        new_event.location = location_array.join(' ')

        
        date = event.css(".experience-extra-details").children.last.text 
        new_event.date = date.gsub(/\n/, "").strip
        
        new_event.url =  "https://www.get-offline.com#{event.attribute('href')}"
        # binding.pry 
        events << new_event
      end
      events
    end

end

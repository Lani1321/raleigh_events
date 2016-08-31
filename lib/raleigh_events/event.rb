class RaleighEvents::Event
  attr_accessor :title, :date, :location, :url


  def self.upcoming
    # scrape get-offline and return events based on that data
    self.scrape_events
  end
    def self.scrape_events
      events = []
      doc = Nokogiri::HTML(open("https://www.get-offline.com/raleigh/upcoming-events"))
     
      doc.css(".experience-thumb").each do |event|
        # instantiating a new Event object as it iterates through each web element
        new_event = self.new  
        new_event.title = event.css("#template-name-link").text.strip
        
        # need to clean up with gsub for example
        # "\n         \n      The Raleigh Times Bar\n   â\u0080¢ Raleigh\n  
        location = event.css(".location-bar").text.gsub("â\u0080¢", "").strip
        location_array = location.split(/\s+(?=(?:[^"]*"[^"]*")*[^"]*$)/)
        location_array.pop
        new_event.location = location_array.join(' ')

        # need to clean up by removing event price: optios are $ or 'Free'
        date = event.css(".experience-extra-details").text.gsub(/Free/, "").strip 
        new_event.date = date.gsub(/-\n/, "").strip
        # Added Https://www.get-offline.com because the html element url only had the second half of url 
        # "/inspiration/jam-with-beer-banjos-every-tuesday"
        new_event.url =  "https://www.get-offline.com#{event.attribute('href')}"
        # binding.pry 
        events << new_event
      end
      events
    end

end

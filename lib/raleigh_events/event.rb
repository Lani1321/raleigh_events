class RaleighEvents::Event
  attr_accessor :title, :date, :location, :url

  @@all = []

  def initialize(attributes = {})
    @title = attributes[:title]
    @date = attributes[:date]
    @location = attributes[:location]
    @url = attributes[:url]
    @@all << self
  end

    def self.all 
      @@all
    end

    def self.scrape_events
      doc = Nokogiri::HTML(open("https://www.get-offline.com/raleigh/upcoming-events"))
     
      doc.css(".experience-thumb").each do |event|
        location = event.css(".location-bar").text.gsub("â\u0080¢", "").strip
      
        # Puts every string into an array and removed the last unwanted value
        location_array = location.split(/\s+(?=(?:[^"]*"[^"]*")*[^"]*$)/)
        location_array.pop
        date = event.css(".experience-extra-details").children.last.text 

        # instantiating a new Event object as it iterates through each web element
        self.new({
          date: date.gsub(/\n/, "").strip,
          title: event.css("#template-name-link").text.strip,
          url: "https://www.get-offline.com#{event.attribute('href')}",
          location: location_array.join(' ')
        })
      end
    end

end

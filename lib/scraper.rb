require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_dog_page
    doc = Nokogiri::HTML(open("http://petadoption.ocpetinfo.com/Adopt/AdoptList.asp?type=Dog&sortBy=intake_date&orderBy=asc"))
    dogs = []
        array = doc.css('table.tblpetbrdr tr')[1..-2]
        array.each do |row|
        dog = {}
        dog[:reference] = row.css("td")[0].text.gsub(/[\r\n\s]+/, "")
        dog[:image] = row.css('td')[0].css('img').attr('src').value
        dog[:name] = row.css("td")[1].text.gsub(/[\r\n\s]+/, "")
        dog[:sex] = row.css("td")[2].text.gsub(/[\r\n\s]+/, "")
        dog[:age] = row.css("td")[3].text.gsub(/[\r\n\s]+/, "")
        dog[:weight] = row.css("td")[4].text.gsub(/[\r\n\s]+/, "")
        dog[:color] = row.css("td")[5].text.gsub(/[\r\n\s]+/, "")
        dog[:breed] = row.css("td")[6].text.gsub(/[\r\n\s]+/, "")
        dog[:intake_juridiction] = row.css("td")[7].text.gsub(/[\r\n\s]+/, "")
        dog[:intake_date] = row.css("td")[8].text.gsub(/[\r\n\s]+/, "")
        dogs << dog
        end
        dogs
        
  end
  
end


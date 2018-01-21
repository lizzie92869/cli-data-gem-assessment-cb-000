require_relative "../lib/scraper.rb"
require_relative "../lib/dog.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInterface
  # BASE_PATH = "http://petadoption.ocpetinfo.com/Adopt/AdoptList.asp?type=Dog&sortBy=intake_date&orderBy=asc"

  def run
    make_dogs
    display_dogs
  end

  def make_dogs
    dogs_array = Scraper.scrape_dog_page
    Dog.create_from_collection(dogs_array)
  end

  def display_dogs
    Dog.all.each do |dog|
      puts "#{dog.name}".colorize(:blue)
      puts "  reference:".colorize(:red) + " #{dog.reference}"
      puts "  sex:".colorize(:light_blue) + " #{dog.sex}"
      puts "  age:".colorize(:light_blue) + " #{dog.age}"
      puts "  weight:".colorize(:light_blue) + " #{dog.weight}"
      puts "  color:".colorize(:light_blue) + " #{dog.color}"
      puts "  breed:".colorize(:light_blue) + " #{dog.breed}"
      puts "  intake juridiction:".colorize(:light_blue) + " #{dog.intake_juridiction}"
      puts "  intake date:".colorize(:light_blue) + " #{dog.intake_date}"
      puts "----------------------".colorize(:red)
    end
  end

end
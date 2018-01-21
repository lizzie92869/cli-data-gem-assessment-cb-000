class Dog

  attr_accessor :reference, :image, :name, :sex, :age, :weight, :color, :breed, :intake_juridiction, :intake_date

  @@all = []

  def initialize(dog_hash)
    dog_hash.each {|k, v| self.send(("#{k}="), v)}
    @@all << self
  end

  def self.create_from_collection(dogs_array)
    dogs_array.each do |dog_hash|
    self.new(dog_hash)
    end
  end

  def self.all
	@@all
  end

end
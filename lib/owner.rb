require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    @@species = "human"
  end

  def say_species
    return "I am a #{@@species}."
  end

  def self.all
    return @@all
  end

  def self.count
    return @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs(dog_name)
     Dog.all.each do |dog|
       binding.pry
       if dog_name == dog.name
         dog.mood = "happy"
       end
     end
  end

end

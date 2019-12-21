require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []
  @@all_pets = []

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

  def walk_dogs
     Dog.all.each do |dog|
        dog.mood = "happy"
     end
  end

  def feed_cats
     Cat.all.each do |cat1|
        cat1.mood = "happy"
     end
  end

  def sell_pets
    #binding.pry
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end

    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets
    return "I have #{Dog.all.each.count{|dog| dog.owner == self}} dog(s), and #{Cat.all.each.count{|cat1| cat1.owner == self}} cat(s)."
  end

end

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

  def buy_cat(desired_cat)
    Cat.all.each do |cat1|
      if cat1 == desired_cat
        cat1.owner = self
      end
     binding.pry
    end
  end

end


require 'pry'
class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@all_dogs = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all_dogs << self
  #  binding.pry
  end

  def self.all
    @@all_dogs
  end

end

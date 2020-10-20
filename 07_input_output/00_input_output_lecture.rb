=begin
Requiring Files Notes

As projects grow more complex, we'll want to separate code into many files.
Such as separating /lib from /spec
or,
project_root/
  Class PetHotel -> pet_hotel.rb
  Class Dog -> dog.rb
  Class Bird -> bird.rb

in separated files

In order to connect these files, we'll use "require relative"
Require relative is a method that specifies a path to another file relative to where 
we are currently.
eg require_relative "./cat.rb"
"./" denotes the current location of our file

=end

#project_root/cat.rb
class Cat
  def initialize(name)
    @name = name
  end
end

#project_root/dog.rb
class Dog
  def initialize(name)
    @name = name
  end
end

#project_root/pet_hotel.rb
#require_relative "./cat.rb"
#require_relative "./dog.rb"
class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

hotel = PetHotel.new("Animal Inn")

cat = Cat.new("Joe")
dog = Dog.new("Jim")

hotel.check_in(cat)
hotel.check_in(dog)

p hotel
#<PetHotel:0x00007f820599f5c8 @name="Animal Inn", 
#   @guests=[
#     <Cat:0x00007f820599f550 @name="Joe">, 
#     <Dog:0x00007f820599f500 @name="Jim">
#   ]
#>

=begin
require vs require_relative
eg. we write: require "rspec", instead of require_relative
because we use "bundle exec rspec", which will automatically find the 
path through $LOAD_PATH

So for gems, we'll use "require"
e.g require "byebug"

  
=end
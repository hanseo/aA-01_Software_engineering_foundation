=begin
Syntactic Sugar
Syntactic Sugar is a "shortcut" code for other code.
It's called "syntactic sugar" becuase it "sweetens" up our code.
eg
#attr_reader
  
=end

class Persona
  attr_reader :name, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def ==(other_person)
    surname == other_person.surname
  end
end

person_1 = Persona.new("jim", "ja")
person_2 = Persona.new("he", "kjfd")
person_3 = Persona.new("Joe", "ja")

#Without Syntactic sugar
p person_1.==(person_2) #=> false
 
#With Syntactic Sugar
p person_1 == person_2 #=> false
p person_1 == person_3 #=> true

class Queue_A
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def add(ele)
    @line << ele
  end

  def remove
    @line.shift
  end
end

groceries = Queue_A.new
groceries.add("Joe")
groceries.add("Jim")

#Without syntactic sugar #[]()
p groceries.[](0) #=> "Joe"
p groceries.[](1) #=> "Jim"

#With Syntactic sugar #[] the number inside will be interpreted
#as the first argument.
p groceries[0] #=> "Joe"
p groceries[1] #=> "Jim"

class Queue_B
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def []=(position, ele)
    @line[position] = ele
  end
    
  def add(ele)
    @line << ele
  end

  def remove
    @line.shift
  end
end

bakery = Queue_B.new
bakery.add("Jay")
bakery.add("Jimmy")

#Without syntactic sugar #[]=(pos, el)
bakery.[]=(0, "Jane") 
p bakery

#With syntactic sugar  #[first_argument] = second_argument
bakery[0] = "Janedoe"
p bakery
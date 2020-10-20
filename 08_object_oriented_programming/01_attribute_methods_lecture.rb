=begin
Attribute Mehotds
Refactoring Getter & Setter Methods

def name
  @name
end

def name=(new_name)
  @name = new_name
end

=end

#Getters using #attr_reader 

class Dog
  attr_reader :name, :age
  #or attr_reader(:name, :age)

  def initialize(name, age)
    @name = name
    @age = age
  end
end

dog = Dog.new("Jay", 4)
p dog.name #=> "Jay"
p dog.age #=>4

#Setters using #attr_writer
class Cat
  attr_writer :name, :age
  #or attr_reader(:name, :age)

  def initialize(name, age)
    @name = name
    @age = age
  end
end

cat = Cat.new("jim", 4)
cat.name = "John"
cat.age = 2
p cat #=> @name = "john", @age=2

#Getter & Setterusing #attr_accessor
class Cow
  attr_accessor :name, :age

  def initialize(name, age, food)
    @name = name
    @age = age
    @food = food
  end
end

cow = Cow.new("jimmy", 3, "pizza")
cow.name
cow.age
cow.age = 1
p cow
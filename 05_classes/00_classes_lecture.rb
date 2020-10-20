=begin
Class
Instead of creating multiples Hashes for each user's data.
eg
cat_1 = {name: "Joe", color: "brown", age: 4}
cat_2 = {name: "Jay", color: "brown", age: 3}
cat_3 = {name: "Jim", color: "orange", age: 4}
...

We can create a Cat Class

=end
#@name, @color, @age is an instance variable or class attribute
#which means our cats will have these properties.

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end

cat_1 = Cat.new("Joe", "brown", 4)
cat_2 = Cat.new("Jay", "brown", 3)
cat_3 = Cat.new("Jim", "orange", 4)
# Cat#new is a method of Cat, but executes Cat#initialize
#why? This will be explained in the future?
#cat_1, cat_2, cat_3 are instances of Cat

#Getter methods are methods that return the value of an attribute/instance variable.
class Dog
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end
end

dog_1 = Dog.new("Jim", 4)
# Dog#name method can be used in any instance of Dog
# eg String#upcase method can be used in any string.
p dog_1.name #=> "Jim"
p dog_1.age

#Setter Methods are methods that modify Class instance @attributes
class Whale
  def initialize(name, age)
    @name = name
    @age = age
  end

  def age
    @age
  end

  def age=(num)
    @age = num
  end
end

whale_1 = Whale.new("Jason", 1)
p whale_1.age
whale_1.age = 45 #or whale_1.age=(45)
p whale_1.age


=begin
Instance Methods VS Class Methods

Instance Methods

=end

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def speak
    @name + " says " + @bark
  end
end

dog_1 = Dog.new("Joe", "woof")
p dog_1.speak 
# Dog#speak is an instace method because we can only call it on a Dog instance
# An instance methods depends on the attributes/varibales of each Instance.

=begin
Class Method
Class Methods are directly called on the class
Cat::growl is a Class Method
We define a Class method by adding "self.", since we refer directly to the Class itself.
Class::methods cannot refer to instance @attributes, like @name, @sound
=end
class Cat
  def initialize(name, sound)
    @name = name
    @sound = sound
  end

  def self.growl #Class::method, we cannot call it  with instances
    "Meoooow"
  end

  def self.who_is_louder(cat_1, cat_2)
    if cat_1.sound.length > cat_2.sound.length
      cat_1.name
    else
      cat_2.name
    end
  end

  def name
    @name
  end

  def sound
    @sound
  end
end

p Cat.growl

cat_1 = Cat.new("Jim", "yeeeeeet")
cat_2 = Cat.new("Jay", "rawr")

p Cat.who_is_louder(cat_1, cat_2)
#We make who_is_louder a Class method becuase the code does not pertain only to one single 
#instance of Cat, it doesn't refer to one instance's @attributes
  

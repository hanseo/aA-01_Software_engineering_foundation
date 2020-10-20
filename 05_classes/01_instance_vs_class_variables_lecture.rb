=begin
instance variables/atrributes vs Class variables  

Instance variables/attributes are denoted with "@"
and are typically assigned inside #initialize

Class variables are used when we want all Class instances to share the same data.
They are denoted with "@@" and are typically assigned inside the Class
=end

class Car
  @@num_wheels = 4 #Class variable, shared among all instances.

  def initialize(color) 
    @color = color #instance variable
  end

  def color #instance variable getter method
    @color
  end

  def num_wheels #class variable getter method
    @@num_wheels
  end
end

car_1 = Car.new("blue")
p car_1.color
p car_1.num_wheels

car_2 = Car.new("red")
p car_2.color
p car_2.num_wheels

#If we were to set a different value for a Class @@variable,
#it would affect all instances

class House
  @@roof_material = "wood"

  def self.upgrade_roofs #we use "self" since it's a Class::method 
    @@roof_material = "platinum"
  end

  def initialize(color)
    @color
  end

  def roof_material
    @@roof_material
  end
end

house_1 = House.new("blue")
house_2 = House.new("red")

p house_1.roof_material #=> "wood"
p house_2.roof_material #=> "wood"

p House.upgrade_roofs #We call Class.method that will affect all instances
#=>"platinum"

p house_1.roof_material #=>"platinum"
p house_2.roof_material #=>"platinum"

#Class CONSTANTS
#CONSTANTS are used when we don't want a Class variable get modified.

class Chair
  NUM_LEGS = 4

  def self.upgrade_legs
    NUM_LEGS = 5 #=> Syntax Error
  end

  def initialize(color)
    @color = color
  end

  def num_legs
    NUM_LEGS
  end
end

chair_1 = Chair.new("brown")
chair_2 = Chair.new("yellow")

p chair_1.num_legs
p chair_2.num_legs

p # Chair.upgrade_legs #=> Syntax Error

p chair_1.num_legs
p chair_2.num_legs



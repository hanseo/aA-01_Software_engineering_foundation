=begin
Monkey Patching consists on adding Methods to existing Classes
e.g We want a method to return a boolean of the already built-in
String#upcase instance method. 
#upcase? 

"hello" is an instance of String

=end

class String
  def upcase? 
    self == upcase #"self" is calling the instance ("hello") / 
    #or instance variable ("HEY")
    #upcase is an instance method, String#upcase
    #self == self.upcase works too
  end
end

p "hello".upcase? #=> false
str_1 = String.new("HEY")
p "hello".instance_of? String #=> true
p str_1.upcase? #=> true
p str_1.downcase #=> false

#Monkey patching Integer#prime? instance method
class Integer
  def prime?
    return false if self < 2

    (2...self).each do |factor|
      if self % factor == 0
        return false
      end
    end

    true
  end
end

p 1.prime? #=> false
p 5.prime? #=> true

#num_1 = Integer.new(11) This doesn't work because the Class Integer is special
#in Ruby and doesn't allow creating new instances for the Class.
#num_1.prime?

#Monkey patch Array#has_zero? instance method 
class Array
  def has_zero?
    self.any?(&:zero?)
    #any?(&:zero?) works too
    #self.include?(0) works too
  end
end
 
p [1, 4, 5].has_zero? #=> false
p [1, 0, 4].has_zero? #=> true
p [1, 0 , 4].instance_of? Array #=> true
arr_1 = Array.new([0, 3, 4])
p arr_1.has_zero? #=> true
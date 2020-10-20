=begin
Object Oriented Programming
 OOP is a design pattern used to build apps.
 The goal is to create programs using objects that interact with each other.
 We use Classes to create those objects.
 OOP is based on Abstraction & Encapsulation 

 - Abstraction
  Abstraction is the proccess of exposing essential features of an object while
  hiding inner details that are not necessary to use that feature.
  e.g You dont neet to know the mechanical details of how a steering wheel
  of a car works, in order to use it.

  Same way, our classes should have methods that are simple to use because 
  they hide complex logic inside.
  
 - Encapsulation
 Encapsulation relates methods and attributes together to prevent misuse.
 The goal is to give users access to things that are *safe* for them to use.
 That's way we're gonna want to keep some data private and hide them from outside
 users for security.
 We do that encapsulating attributes for methods.
=end

#Abstraction
#Couse_A does NOT abstract how to enroll a student in the course.
class Course_A
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def max_students
    @max_students
  end

  def students
    @students
  end
end

course_a = Course_A.new("OOP_1", ["Joe, Jim, Jay"], 4)
p course_a.students #=> []

if course_a.students.length < course_a.max_students
  course_a.students << "Alice"
end

p course_a.students #=> ["Alice"]

#Course_B DOES abstract with #enroll
#with a much readable and easier to use code
class Course_B
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def enroll(student)
    @students << student if @students.length < @max_students
  end
end

course_b = Course_B.new("OOP_1", ["Joe, Jim, Jay"], 4)
course_b.enroll("Jane") 

#We've been using Abstraction for a long time.
#eg Array#include? 

#Encapsulation

class Queue
  def initialize
    @line = []
  end

  def add(ele)
    @line << ele
  end

  def remove
    @line.shift
  end
end

grocery_checkout = Queue.new
grocery_checkout.add("joe")
grocery_checkout.remove
grocery_checkout.add("jim")
grocery_checkout.remove
grocery_checkout.add("hay")
grocery_checkout.add("bae")
grocery_checkout.remove
grocery_checkout.remove
#We didn't give the user full access to @line, no getter method for @line
#This way we can enforce the rules
#otherwise we could do:
#grocery_checkout.line.unshift("gg") => "gg" cut the line

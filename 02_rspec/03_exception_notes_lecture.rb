=begin
   Sometimes we still want to run the rest of the program 
   even when there's an exception / "error" 
   In those cases, we use 
   begin + rescue + end 
=end

num = 0

begin
  puts "dividing 10 by #{num}"
  ans = 10 / num
  puts "the answer is #{ans}"
rescue
  puts "There was an error with that division"  
end

puts "-----"
puts "finished"

#How it works?
#begin block will execute until an exception/ "error" hits
#When we reach the exception, the program will jump to rescue
#If an exception/ "error" is not found, then rescue will never run.

n = 1

begin
  puts "dividing 10 by #{n}"
  ans = 10 / n
  puts "the answer is #{ans}"
rescue 
  puts "There was an error with that division"  
end

=begin
Implementing our own Exceptions / "errors" instead of native errors, 
like "NoMethodError"

def format_name(fist, last)
  first.capitalize + " " + last.capitalize
end

format_name("grace", "hoPPER") # => "Grace Hopper"
format_name(42, true) #=> NoMethodError: undefined method "capitalize"
We want the exception method to really describe how our format_name
was misused + we can protect our code better.
format_name(42, true) #=> RuntimeError: arguments must be strings
=end

def format_name(first, last)
  if !((first.instance_of?(String)) && last.instance_of?(String))
    raise "arguments must be strings"
  end

  first.capitalize + " " + last.capitalize
end

first_name = 42
last_name = true
begin
  puts format_name(first_name, last_name)
rescue 
  puts "there was an exception :("
end

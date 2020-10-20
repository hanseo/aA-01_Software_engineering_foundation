=begin
we'll use IO#gets as the method to allow user give input.
The IO(Input Output) Class is the basis for all input and output in Ruby.
when IO#gets is called, the program will halt the code and
  allow the user to type characters until they  press enter.
When enter is hit, #gets will return a "string" containing the user input.
  
=end
p "Enter your name:"
name = gets
p "hello " + name #=> "hello Hanseo\n"

=begin
Because the user presses enter to return #gets
a new line "\n" will be added to the returned string
That's why we use String#chomp
=end

my_str =  "yes\n"
p my_str #=> "yes\n"
p my_str.chomp #=> "yes"

p "Enter a number:"
num = gets.chomp.to_i #gets returns a string!!
p 2 * num

=begin
Difference between Random#rand and Array#sample
#rand is an instance method of the Random Class
#sample is an instance method of Array Class
=end

random_num = Random.new
p random_num.rand(100) #Returns a random integer >= 0 && integer < 100. eg 42
p random_num.rand(1.5) #Returns a random floating integer >= 0 && floating integer < 100. eg 1.46
p random_num.rand(2..5) #Returns a random integer >= 2 && integer < 5. eg 4

sample_num = Array.new([1, 5, 6])

p sample_num.sample #=> Returns a number from the array, it's not a random number, 
#but it's a random index of the array
p sample_num.sample(4) #=> Returns 4 random elements of the array

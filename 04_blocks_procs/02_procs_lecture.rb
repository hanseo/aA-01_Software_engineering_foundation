=begin
Procs
Procs are objects or custom methods containing blocks.
We can save the Proc to a variable (e.g : doubler)
This is the only way to save a block to a variable.
-To execute the proc we use Proc#call method

#Incorrect:
doubler = { |block_param| block_param * 2 } #=> SyntaxError
=end

doubler = Proc.new { |block_param| block_param * 2 }
p doubler.call(5)

tripler = Proc.new do |block_param|
  block_param * 3
end

p tripler.call(5)


#We can add Procs inside Methods  
  
def add_and_proc(method_param_1, method_param_2, prc)
  sum = method_param_1 + method_param_2
  p prc.call(sum)
end

square_object = Proc.new { |block_param| block_param * block_param }
add_and_proc(2, 3, square_object)

#We can convert a block to an object/Proc 
#adding "&" to the method_param
#adding the block {} in the method call, outside!! the arguments (e.g: (2, 3) {})

def add_and_proc_object(method_param_1, method_param_2, &block_to_proc)
  sum = method_param_1 + method_param_2
  p block_to_proc.call(sum)
end

add_and_proc_object(2, 3) { |block_param| block_param * block_param }


#If we add "&" to a Proc, which is already an object, it will convert it back
#to a block
def convert_back(method_param_1, method_param_2, &block_to_proc_object)
#&prc is expecting a block to be converted into an object
  sum = method_param_1 + method_param_2
  p block_to_proc_object.call(sum)
end

proc_to_block = Proc.new { |block_param| block_param * block_param }
#But this is already a Proc, so either we only add the block in the method call 
#argument, like in the previous example or, we convert it into a Block.
convert_back(2, 3, &proc_to_block)


#Conclusion
def print_phrase(&block_to_object)
  p block_to_object.class #=>It's a Proc
  block_to_object.call
end

print_phrase { p "I'm a block turned into an object and I dont need parameters" }

=begin
Methods only accept one (&block) as parameter
def method_with_two_blocks(&block_1, &block_2)
  block_1.call
  block_2.call
end
Would raise an error
=end
p [1, 2, 3].map { |block_param| block_param * 2 }

this_proc_is_now_a_block = Proc.new { |block_param| block_param * 2 }
p [1, 2, 3].map(&this_proc_is_now_a_block)

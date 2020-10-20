#Pry
=begin
Pry is a REPL (Read, Evaluate, Print, Loop)
pry(main)> ls String => shows all method available for String
or my_str = "hello"
pry(main)> ls my_str => shows all method available for String
pry(main)> show-source String#length -d => to learn more about #length method
#Also shows how is built in C language

load => to load the entire .rb file to Pry
pry(main)> load "00_debugging_lecture.rb" => true
pry(main)>is_even?(2) => true

pry(main)> show-source is_even? => shows the code inside the method
=> From: 00_debugging_lecture.rb:11:
  Owner: Object
  Visibility: private
  Signature: is_even?(num)
  Number of lines: 3

  def is_even?(num)
    num % 2 == 0
  end


=end


def is_even?(num)
  num % 2 == 0
end

=begin
Byebug
in order to Run Byebug, we need:
- require "byebug" #at the top of the file
- debugger #where you want the debugger mode to start

while in debugger mode:
  - l <start line>-<end line> #list the line numbers. eg. l 3-20
  - step / s #step into the method call, if possible.
  - next / n # move to next line.
  - break <line num> / b <line num> # place a breakpoint to pause execution
  - delete <line num> #deletes breakpoints. eg delete 5
  - continue / c # resume normal execution until breakpoint or program ends
  - display <variable> #automatically show value of variable.
end


=end

require "byebug"

def is_prime?(num)
  (2...num).each do |factor|
    return false if num % factor == 0
  end

  num > 1
end

def first_n_primers(num_primes)
  primes = []
  num = 2
  debugger
  while primes.length < num_primes
    primes << num if is_prime?(num)
    num += 1
  end
  
  primes
end

p first_n_primers(11)

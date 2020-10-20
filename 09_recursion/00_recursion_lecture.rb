=begin
Recursion
Recursion happens when a #method calls himself
=end

def say_hello
  p "hello"
  say_hello
end

#say_hello #Infinite loop!
#SystemStackError: stack level too deep.
#What does this mean? Every time we call a #method, some of our system's 
#memory is used to execute it. This is called "adding to the stack"
#Since #say_hello calls the #method forever, we'll run out of space on the
#stack (run out of memory) and it will crash!

def infinite_count_down(num)
  p num
  count_down(num - 1)
end

#infinite_count_down(10) 
#We get in another infinite loop!
=begin
  p 10
  count_down(9)
    p 9
    count_down(8)
      p 8
      count_down(7)
        p 7 
        count_down(6)
        ...
        forever loop
=end

def count_down(num)
  if num == 0
    p "Let's go"
    return
  end

  p num
  count_down(num - 1)
end

count_down(10)
=begin 
  p 9
  count_down(9)
    p 9
    count_down(8)
      p 8
      count_down(7)
        p 7
        count_down(6)
          p 6
          count_down(5)
            p 5
            count_down(4)
              p 4
              count_down(3)
                p 3
                count_down(2)
                  p 2
                  count_down(1)
                    p 1
                    count_down(0)
                    p "Let's go"
                    return
=end
    
#We need a way to stop recursive infinite loops
#In this case, we used an "if statement" / Base case
# Recursive #methods have 2 parts:
  #Base case, that stops the recursion
  #Recursive step, that continues the recursion

def count_up(num)
  #base case
  if num == 10
    p "Let's go"
    return
  end

  p num
  #recursive step
  count_up(num + 1)
end

count_up(0)

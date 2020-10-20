=begin
What is TDD? (Test Driven Development)
It's a strategy to develop programs where the requiremtns are turned into test cases.
1. Write a new test
2. Run all tests & chec for fail
3. Make changes to the method to pass the test
4. Run tests & check for passes
5. Iterate till al tests pass.
  

Even if we anticipate further functionality requirements, we should save implementing it 
until we reach another TDD iteration cycle.
end
=end

#Before we try to pass a test, we should test it. To make sure we wrote it correctly 
#and it fails.
#TDD iteration: Return false if the number is not prime.
def prime?(num)
end

prime?(6) #=> nil (Test failed)
prime?(8) #=> nil (Test failed)

#Make changes to the method
def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
end

prime?(6) #=> false (Test passed)
prime?(8) #=> false (Test passed)

#TDD iteration: Add Return true if the number is prime
def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
end

prime?(2) #=> nil (Test failed)
prime?(7) #=> nil (Test failed)

#Make changes to the method to pass the test
def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

prime?(2) #=> true (Test passed)
prime?(7) #=> true (Test passed)

#Our method needs to handle numbers lower than 2
#TDD iteration: Return false if the number is lower than 2
def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

prime?(1) #=> nil (Test failed)
prime?(-3) #=> nil (Test failed)

#Make changes to the method to pass the test.
def prime?(num)
  return false if num < 2
  
  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

=begin
What we've seen so far was Manual testing. However, this method is vulnerable to:
false positives and false negatives.
So we make Test Suites, a collection of test cases. The most popular library for
this is RSpec.
Another word for "test" is "spec" ("specification")
RSpec Structure:
/example_project
  /lib
    /add.rb
    /prime.rb
  /spec
    /add_spec.rb
    /prime_spec.rb


Key words in RSpec: describe, it , expect, context
=end

#/spec/add_spec.rb
require "add" #/lib/add.rb

describe "add method" do #"describe" names the method being tested
  #"it" expresses the expected behaviour of the method being tested
  it "should accept two numbers as argumetns" doexpect { add(2, 3) }.to_not raise_error
end

  it "should retunr the sum of thw two numbers" do 
  expect(add(2, 3)).to eq(5) #"expect" shows how the behaviour is tested
  expect(add(10, 12)).to eq(22)
  end
end

#/lib/add.rb
def add(num_1, num_2)
  num_1 + num_2
end

#/spec/prime_spec.rb
require "prime"

describe "prime? method" do
  it "shuold accept a number as an argument" do
    expect { prime?(7) }.to_not raise_error
  end

  context "when the number is prime" do #contextused for different scenarios
    it "should return true" do 
      expect(prime?(7)).to eq(true)
      expect(prime?(11)).to eq(true)
      expect(prime?13).to eq(true)
    end
  end

  context "when the number is not prime" do
    it "should return false" do
      expect(prime?(4)).to eq(false)
      expect(prime?(8)).to eq(false)
      expect(prime?(6)).to eq(false)
    end
  end
end



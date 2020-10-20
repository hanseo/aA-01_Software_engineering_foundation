=begin
#Regex = Regular Expressions
They're defined between //
e.g Fid the world "like"
"do you like cats?" =~ /like/   => 7, index of the first time "like"
 appears. If not found returns nil

 If we don't care abt the index, we could use String#include?
 We can use it on String#match too:
 if "do you like cats?".match(/like/)
  p "Match found!"
 end

##Character Classes, let you define a range/ list of characters to match.
  e.g [aeiou]
  Does the string contain vowels?

  def contain_vows?(str)
    str =~ /[aeiou]/
  end

  contain_vows?("test") => returns 1, index where first vowel is found, "e" in this case
  contain_vows?("sky")  => returns nil

##Ranges, we can match multiple chars or numbers, without having to type them all.
  e.g [0-5] == [0, 1, 2, 3, 4, 5]
  [a-z] == (a..z).to_a
  [^a-z] = everything except (a..z).to_a
  ^ is the negation operation

=end

def contains_num(str)
  str =~ /[^a-z]/ #=> match anything that is not (a..z).to_a
end

def cont_num(str)
  str =~ /[0-9]/
end

#contains_num & cont_num will return the same values
#remember, `=~` returns the string index or nil
#p contains_num("a0012A") #=> 1, index of 0
#p contains_num("asdf")  #=> nil, no matches found

#p cont_num("a0012A") #=> 1, index of 0
#p cont_num("asdf")   #=> nil, no matches found

##Shortcut syntax for ranges:
# \w = [0-9a-zA-Z]
# \d = [0-9]
# \s = white space, tabs, newline

##Negative form:
# \W != [0-9a-zA-Z]
# \D != [0-9]
# \S != white space, tabs, newline

## `.` = match with everything, except new lines
#e.g 
# "5a5".match (/\d.\d/) #=> it will match 5 is \d ; a is . ; 5 is \d

#if we want to target a literal ".", we use \.
# "5a5".match(/\d\.\d/) #=> nil
# "5.5".math(/\d\.\d/) #=> match found

##Modifiers, to match multiple chars 
# + = 1 or more
# * = 0 or more
# ? = 0 or 1
# {3,5}  = between 3 and 5
  # important abt {3,5}, no spaces in between when writing
  # {3, 5} NO

# `!!`, will convert the value into a boolean
#eg. is it an ip address?
def ip_address?(str)
  !!(str =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
  #str.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
end

#p ip_address?("192.168.1.1")  #=> true
#p ip_address?("168.1.1")      #=> false

#p ip_address?("92.168.1.100000")  #=> true, this is not exactly what we want
#<MatchData "92.168.1.100">
#p ip_address?("1111192.168.1.100000")  #=> true
##<MatchData "192.168.1.100"> , only selects the pattern that matches
#p ip_address?("1111192.168111.1.100000")  #=> false, here we don't have a matching
#pattern

##Exact String Matching
# `/^ $/`` , we use this syntax to determine beginning and end of line

def exact_ip_address?(str)
  !!(str =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
end

#p exact_ip_address?("192.168.1.100000") #=> false
#p exact_ip_address?("192.168.1.1")      #=> true

#p "Regex is cool".match(/\w{4}/) #=><MatchData "Rege">
#p "Regex is cool".match(/\w{1,3}/) #<MatchData "Reg">
#If we want to find a word that is exactly length == 4:
#p "Regex is cool".match(/^\w{4}$/)  #=> nil


##Capture Groups, we can capture parts of a match and reuse it later


def squarocol?(arr_2d)
  return true if arr_2d.any? { |arr| arr.all? { |el| arr[0] == el } }

  new_arr = Array.new(arr_2d.length) { Array.new }

  arr_2d.each do |arr|
    (0...arr.length).each do |i|
      new_arr[i] << arr[i]
    end
  end
  
  new_arr.any? { |arr| arr.all? { |el| arr[0] == el } }
end

#There's a method Array#transpose that changes rows for columns
#if length of subarrays don't match an error is raised
#eg [[1,2], [3,4], [5,6]].transpose #=> [[1, 3, 5] [2, 4, 6]]
#Refactored squarocol?(arr_2d)
# def squarocol?(arr_2d)
#  return true if arr_2d.any? { |row| row.uniq.length == 1 } }
#  return true if arr_2d.transpose.any? { |col| col.uniq.length == 1 } }
# end

=begin
p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false
=end

def squaragonal?(arr_2d)
  reversed = arr_2d.map(&:reverse)
  diag_0 = diagonal(arr_2d)
  diag_1 = diagonal(reversed)

  diag_0.all? { |el| el == diag_0[0] } || diag_1.all? { |el| el == diag_1[0] } 
end

def diagonal(arr_2d)
  new_arr = []

  (0...arr_2d.length).each do |i|
    new_arr << arr_2d[i][i]
  end

  new_arr
end

=begin
p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
=end

=begin
  formula(rowk, posl): k! / (l! * (k - l)!)
  e.g row4, pos2: 
    4! / (2! * (4 - 2)!))
    4*3*2*! / (2*1 * 2*1) = 6
    4! = (1..4).inject(:*)
=end
def factorial(n)
  row = []
  middle = []

  k = (1..n).inject(:*)

  (1...n).each do |pos|
    l = (1..pos).inject(:*)
    k_l = (1..n-pos).inject(:*)
    
    middle << k / (l * k_l)
  end

  row = [1] + middle + [1]
end

def pascals_triangle(n)
  return [1] if n == 1
  pascal = []

  (1...n).each do |el|
    pascal << factorial(el)
  end

  pascal
end
  
#p pascals_triangle(1)
#p pascals_triangle(2)
#p pascals_triangle(5)
#p pascals_triangle(7)
#p pascals_triangle(15)
def my_map(arr, &doubler)
  new_arr = []
  arr.each { |num| new_arr << doubler.call(num) }
  new_arr
end

def my_select(arr, &even)
  new_arr = []
  arr.each { |num| new_arr << num if even.call(num) }
  new_arr
end

def my_count(arr, &even)
  count = 0
  arr.each { |num| count += 1 if even.call(num) }
  count
end

def my_any?(arr, &even)
  arr.each { |num| return true if even.call(num) }
  false
end

def my_all?(arr, &odd)
  arr.each { |num| return false if !odd.call(num)}
  true
end

def my_none?(arr, &even)
  arr.each { |num| return false if even.call(num) }
  true
end
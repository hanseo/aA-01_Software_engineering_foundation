def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
  str.split(" ").map(&prc).join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  [prc_1.call(num), prc_2.call(num)].max
end

def and_selector(arr, prc_1, prc_2)
  new_arr = []
  arr.each { |ele| new_arr << ele if prc_1.call(ele) && prc_2.call(ele) }  
  new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
  new_arr = []
  arr.each.with_index { |ele, i| i.even? ? new_arr << prc_1.call(ele) : new_arr << prc_2.call(ele) }
  new_arr
end
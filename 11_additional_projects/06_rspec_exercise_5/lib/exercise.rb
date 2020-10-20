def zip(*arrs)
  length = arrs.first.length

  (0...length).map do |i|
    arrs.map { |arr| arr[i] }
    #for 0, we return ["a",1,"w"]
  end
end

def prizz_proc(arr, prc_1, prc_2)
  arr.select do |el|
    (prc_1.call(el) || prc_2.call(el)) && (!(prc_1.call(el) && prc_2.call(el)))
  end
end

def zany_zip(*arrs)
  longest = arrs.max_by(&:length).length

  (0...longest).map do |i|
    arrs.map { |arr| arr[i] }
  end
end

def maximum(arr, &prc)
  arr.inject do |acc, el|
    if (prc.call(acc) <=> prc.call(el)) == 1
      acc
    else
      el
    end
  end
end

def my_group_by(arr, &prc)
  new_hash = Hash.new([])
  arr.each do |el|
    new_hash[prc.call(el)] += [el]
  end

  new_hash
end

def max_tie_breaker(arr, prc_1, &prc_2)
  max_ele = arr.max_by(&prc_2)
  new_arr = arr - [max_ele]

  return max_ele if new_arr.all? { |ele| prc_2.call(ele) != prc_2.call(max_ele) }

  arr.select { |ele| prc_2.call(ele) == prc_2.call(max_ele) }.max_by(&prc_1)
end

def silly_syllables(sentence)
  vowels = "aeiou"

  sentence.split.map do |word|
    indexes = []
    word.each_char.with_index do |el, i|
      indexes << i if vowels.include?(word[i])
    end

    if indexes.length < 2
      word
    else
      word[(indexes.first)..(indexes.last)]
    end
  end.join(" ")
end

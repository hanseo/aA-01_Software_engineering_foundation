def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |dogs| dogs["age"] < 3 }
end

def count_positive_subarrays(arr)
  arr.count { |ele| ele.sum > 0 }
end

def aba_translate(word)
  vowels = "aeiou"
  new_word = ""

  word.each_char do |char|
    if vowels.include?(char)
      new_word += char + "b" + char
    else
      new_word += char
    end
  end

  new_word
end

def aba_array(arr)
  arr.map { |ele| aba_translate(ele) }
end
def all_words_capitalized?(arr)
  arr.all? { |ele| ele == ele.capitalize }
end

def no_valid_url?(arr)
  endings = [".com", ".net", ".io", ".org"]
  arr.none? do |ele| 
    endings.any? { |ending| ele.end_with?(ending) }
  end
end

def any_passing_students?(students)
  students.any? { |student| student[:grades].sum / student[:grades].length >= 75 }
end
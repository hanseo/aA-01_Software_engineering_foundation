# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?

    self.max - self.min
  end

  def average
    return nil if empty?

    self.sum * 1.0 / self.length
  end

  def median
    return nil if empty?

    if self.length.even?
      [self.sort[self.length / 2], self.sort[(self.length / 2) - 1]].average
    else
      self.sort[self.length / 2]
    end
  end

  def counts
    count_hash = Hash.new(0)
    self.each { |num| count_hash[num] += 1 }

    count_hash
  end

  def my_count(num)
    counts[num]
  end

  def my_index(num)
    return nil if !self.include?(num)
    self.each_with_index { |ele, i| return i if ele == num }
  end

  def my_uniq
    new_arr = []

    self.each { |ele| new_arr << ele if !new_arr.include?(ele) }

    new_arr
  end

  def my_transpose
    new_arr = Array.new(self.length) { Array.new }

    (0...self.length).each do |i|
      self.each { |arr| new_arr[i] << arr[i] }
    end

    new_arr
  end

end

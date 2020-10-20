class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    Code.new(Array.new(length) { POSSIBLE_PEGS.keys.sample })
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def initialize(arr)
    raise "invalid pegs" if !Code.valid_pegs?(arr)
    @pegs = arr.map(&:upcase)
  end
  
  def [](i)
    pegs[i]
  end

  def length
    pegs.length
  end

  def num_exact_matches(code)
    count = 0

    pegs.each.with_index do |char, i|
      count += 1 if char == code[i]
    end

    count
  end

  def num_near_matches(code)
    count = 0

    code.pegs.each { |char| count += 1 if pegs.include?(char) }
    count - num_exact_matches(code)
  end

  def ==(code)
    pegs == code.pegs
  end
end

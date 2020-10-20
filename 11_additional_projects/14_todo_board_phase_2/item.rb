class Item
  attr_accessor :title, :description
  attr_reader :deadline, :done

  def self.valid_date?(date_string)
    date = date_string.split("-").map(&:to_i)
    year, month, day = date

    return false if date.length != 3
    return false if !(month > 0 && month < 13 && day > 0 && day < 32)

    true
  end

  def initialize(title, deadline, description)
    raise "invalid format" if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def deadline=(new_deadline)
    raise "invalid format" if !Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end

  def toggle
    @done = !@done
  end
end
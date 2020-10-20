require_relative "item.rb"

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = "")
    return false if !Item.valid_date?(deadline)
    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.size
  end

  def valid_index?(i)
    (0...@items.size).include?(i)
  end

  def swap(i_1, i_2)
    return false if [i_1, i_2].any?{ |i| !valid_index?(i) }

    @items[i_1], @items[i_2] = @items[i_2], @items[i_1]
    true
  end

  def [](i)
    @items[i]
  end

  def priority
    @items.first
  end

  def print
    puts "-" * 41
    puts "#{label.upcase.center(41)}"
    puts "-" * 41
    puts "Index".ljust(8) + "| " + "Item".ljust(18) + "| " + "Deadline"
    puts "-" * 41
    @items.each.with_index do |item, i|
      puts "#{i.to_s.ljust(8)}| #{item.title.ljust(18)}| #{item.deadline}"
    end
    puts "-" * 41
  end

  def print_full_item(i)
    if valid_index?(i)
      puts "-" * 41
      puts "#{@items[i].title.ljust(41/2)} #{@items[i].deadline.rjust(41/2)}"
      puts "#{@items[i].description}"
      puts "-" * 41
    end
  end

  def print_priority
    print_full_item(0)
  end

  def up(i, amnt = 1)
    return false if !valid_index?(i)
    return true if i == 0 || amnt == 0 

    swap(i, i - 1)
    up(i - 1, amnt - 1)
  end

  def down(i, amnt = 1)
    return false if !valid_index?(i)
    return true if i == (size - 1) || amnt == 0 

    swap(i, i + 1)
    down(i + 1, amnt - 1)
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end
end
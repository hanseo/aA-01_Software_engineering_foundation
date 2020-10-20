require_relative "item.rb"

class List
  CHECKMARK = "✓"
  LINE_WIDTH = 49
  INDEX_COL_WIDTH = 5
  ITEM_COL_WIDTH = 20
  DEADLINE_COL_WIDTH = 10

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
    puts "-" * LINE_WIDTH
    puts "#{label.upcase.center(LINE_WIDTH)}"
    puts "-" * LINE_WIDTH
    puts "#{"Index".ljust(INDEX_COL_WIDTH)} | #{"Item".ljust(ITEM_COL_WIDTH)} | #{"Deadline".ljust(DEADLINE_COL_WIDTH)} | Done"
    puts "-" * LINE_WIDTH
    @items.each.with_index do |item, i|
      status = item.done ? "[#{CHECKMARK}]" : "[ ]"
      puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | #{status}"
    end
    puts "-" * LINE_WIDTH
  end

  def print_full_item(i)
    if valid_index?(i)
      status = @items[i].done ? "[#{CHECKMARK}]" : "[ ]"
      puts "-" * LINE_WIDTH
      puts "#{@items[i].title}".ljust(LINE_WIDTH/2) + "#{@items[i].deadline} #{status}".rjust(LINE_WIDTH/2)
      puts "#{@items[i].description}"
      puts "-" * LINE_WIDTH
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

  def toggle_item(i)
    return false if !valid_index?(i)
    @items[i].toggle
  end

  def remove_item(i)
    return false if !valid_index?(i)
    @items.delete_at(i)
    true
  end

  def purge
    @items.delete_if(&:done)
  end
end
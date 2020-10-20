require_relative "list.rb"

class TodoBoard
  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    puts "Enter a command: "
    cmd, *args = gets.chomp.split

    case cmd
    when "mktodo"
      @list.add_item(*args)
    when "up"
      @list.up(*args.map(&:to_i))
    when "down"
      @list.down(*args.map(&:to_i))
    when "swap"
      @list.swap(*args.map(&:to_i))
    when "sort"
      @list.sort_by_date!
    when "priority"
      @list.print_priority
    when "print"
      args.empty? ? @list.print : @list.print_full_item(*args.map(&:to_i))
    when "quit"
      return false
    else
      print "Sorry, that command is not recognised."
    end

    true
  end

  def run
    until !get_command
      get_command
    end 
  end
end

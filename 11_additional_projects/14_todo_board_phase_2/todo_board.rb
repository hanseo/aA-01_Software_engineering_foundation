require_relative "list.rb"

class TodoBoard
  def initialize
    @board = {}
  end

  def get_command
    puts "Enter a command: "
    cmd, label, *args = gets.chomp.split

    case cmd
    when "mklist" 
      @board[label] = List.new(label)

    when "ls"
      puts @board.keys

    when "showall"
      @board.each { |k, v| v.print }

    when "mktodo" 
      @board[label].add_item(*args)

    when "toggle"
      @board[label].toggle_item(args[0].to_i)

    when "rm"
      @board[label].remove_item(args[0].to_i)

    when "purge"
      @board[label].purge

    when "up"
      @board[label].up(*args.map(&:to_i))

    when "down"
      @board[label].down(*args.map(&:to_i))

    when "swap"
      @board[label].swap(*args.map(&:to_i))

    when "sort"
      @board[label].sort_by_date!

    when "priority"
      @board[label].print_priority

    when "print"
      args.empty? ? @board[label].print : @board[label].print_full_item(args[0].to_i)
   
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

TodoBoard.new.run

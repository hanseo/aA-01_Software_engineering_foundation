require_relative "room"

class Hotel
  def initialize(name, capacity)
    @name = name
    @rooms = {}
    capacity.each do |k, v|
      @rooms[k] = Room.new(v)
    end
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end
  
  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(occupant, room_name)
    if room_exists?(room_name)
      p rooms[room_name].add_occupant(occupant) ? "check in successful" : "sorry, room is full"
    else
      p "sorry, room does not exist"
    end
  end
      
  def has_vacancy?
    rooms.any? { |room_name, capacity| !rooms[room_name].full? }
  end

  def list_rooms
    rooms.each do |room_name, capacity|
      puts "#{room_name} : #{rooms[room_name].available_space}"
    end
  end
end


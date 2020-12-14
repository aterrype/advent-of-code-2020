instructions = []

File.foreach("input.txt", "\n") do |line|
  instructions << line.strip
end

position = [0, 0]
pointedDirection = "E"
directions = ["N", "E", "S", "W"]

instructions.each do |instruction|
  direction = instruction[0]
  value = instruction[1..].to_i
  direction = pointedDirection if direction == "F"
  case direction
  when "N"
    position[1] += value
  when "S"
    position[1] -= value
  when "E"
    position[0] += value
  when "W"
    position[0] -= value
  when "L"
    pointedDirection = directions[(directions.find_index(pointedDirection) - (value/90)) % 4]
  when "R"
    pointedDirection = directions[(directions.find_index(pointedDirection) + (value/90)) % 4]
  end
end

puts position[0].abs + position[1].abs
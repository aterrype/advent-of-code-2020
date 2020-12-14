instructions = []

File.foreach("input.txt", "\n") do |line|
  instructions << line.strip
end

shipPosition = [0, 0]
waypoint = [10, 1]

instructions.each do |instruction|
  direction = instruction[0]
  value = instruction[1..].to_i
  case direction
  when "N"
    waypoint[1] += value
  when "S"
    waypoint[1] -= value
  when "E"
    waypoint[0] += value
  when "W"
    waypoint[0] -= value
  when "L", "R"
    if value == 180
      waypoint.map! { |i| i * -1 }
    elsif instruction == "L90" || instruction == "R270"
      waypoint = [waypoint[1] * -1, waypoint[0]]
    elsif instruction == "L270" || instruction == "R90"
      waypoint = [waypoint[1], waypoint[0] * -1]
    end
  when "F"
    shipPosition[0] += waypoint[0] * value
    shipPosition[1] += waypoint[1] * value
  end
end

puts shipPosition[0].abs + shipPosition[1].abs
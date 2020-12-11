seats = []

File.foreach("input.txt", "\n") do |line|
  seats << line.strip.split("")
end

seatsChanged = true
while seatsChanged do
  newSeats = seats.clone.map(&:clone)
  seats.each_with_index do |row, rowIdx|
    row.each_with_index do |seat, colIdx|
      adjacentSeats = []
      for i in (rowIdx - 1..rowIdx+1) do
        for j in (colIdx - 1..colIdx+1) do
          if !(i == rowIdx && j == colIdx)
            seatFound = false
            while (i >= 0 && j >= 0 && seats[i] && seats[i][j] && !seatFound)
              adjacentSeat = seats[i][j]
              if adjacentSeat == "L" || adjacentSeat == "#"
                adjacentSeats << adjacentSeat
                seatFound = true
              else
                i += 1 if i > rowIdx
                i -= 1 if i < rowIdx
                j += 1 if j > colIdx
                j -= 1 if j < colIdx
              end
            end
          end
        end
      end
      if seat == "L"
        newSeats[rowIdx][colIdx] = "#" if adjacentSeats.count("#") == 0
      elsif seat == "#"
        newSeats[rowIdx][colIdx] = "L" if adjacentSeats.count("#") >= 5
      end
    end
  end
  if seats == newSeats
    seatsChanged = false
  else
    seats = newSeats
  end
end

totalOccupied = 0
seats.each do |row|
  totalOccupied += row.count("#")
end

puts totalOccupied
passports = []
currentPassport = []

File.foreach("input.txt", "\n") do |line|
  if line.strip == ""
    passports << currentPassport
    currentPassport = []
  else
    line.split().each do |item|
      currentPassport << item
    end
  end
end

passports << currentPassport if currentPassport != [] # The last line might not be blank

validPassports = 0
codes = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

passports.each do |passport|
  validPassports += 1 if codes.all? { |code| passport.any? { |item| item[0..2] == code } }
end

puts validPassports
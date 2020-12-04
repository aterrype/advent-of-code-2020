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
  if codes.all? { |code| passport.any? { |item| item[0..2] == code } } # Make sure we have all the codes first
    byr = passport.grep(/byr/)[0][4..].to_i
    next if !(1920 <= byr && byr <= 2002)

    iyr = passport.grep(/iyr/)[0][4..].to_i
    next if !(2010 <= iyr && iyr <= 2020)

    eyr = passport.grep(/eyr/)[0][4..].to_i
    next if !(2020 <= eyr && eyr <= 2030)

    hgt = passport.grep(/hgt/)[0][4..]
    if hgt[-2..] == "cm"
      next if !(150 <= hgt[0..-3].to_i && hgt[0..-3].to_i <= 193)
    elsif hgt[-2..] == "in"
      next if !(59 <= hgt[0..-3].to_i && hgt[0..-3].to_i <= 76)
    else
      next
    end

    hcl = passport.grep(/hcl/)[0][4..]
    next if !(hcl.match?(/^\#\h{6}$/))

    ecl = passport.grep(/ecl/)[0][4..]
    validColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    next if !(validColors.include?(ecl))

    pid = passport.grep(/pid/)[0][4..]
    next if !(pid.match?(/^\d{9}$/))

    validPassports += 1
  end
end

puts validPassports
module Luhn
  def self.is_valid?(number)
    # breaks credit card number into string of individual integers
    numbers = number.to_s.split("").map {|x| x.to_i}
    # creates empty array
    new_numbers = []
    # reverses the array and doubles every second digit
    # if doubled digit is 10 or greater, subtracts 9 from it.
    numbers.reverse.each_with_index do |num, index|
        if index % 2 == 1
            num = num * 2
            num = num - 9 if num >= 10
        end
    #pushes new numbers to the empty array, creating new array.
        new_numbers << num
    end

    # gets sum of the numbers in array.
    # sees if divisible by 10
    new_numbers.reduce(&:+) % 10 == 0
    end
end

puts "The number is valid? #{Luhn.is_valid?(4194560385008504)}"
puts "The number is valid? #{Luhn.is_valid?(4194560385008505)}"
puts "The number is valid? #{Luhn.is_valid?(377681478627336)}"
puts "The number is valid? #{Luhn.is_valid?(377681478627337)}"
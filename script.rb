require 'pry-byebug'

$pairs_hash = {}

def make_hash 
  array_of_letters = ("a".."z").to_a
  p array_of_letters
  array_of_letters.each_with_index {|letter, index| 
  $pairs_hash.store(letter, index+1)}
  array_of_letters = ("A".."Z").to_a
  p array_of_letters
  array_of_letters.each_with_index {|letter, index| 
  $pairs_hash.store(letter, index+27)}
  p $pairs_hash
  end

  make_hash

  $chiphered_value = []
  $numbered_value = []
  $chiphered_array = []
  $string_value = gets.chomp
  $shift_value = 5
  $shift_value_negative = 26 - $shift_value

  def string_conversion_to_numbers 
    $string_value = $string_value.split('')
    p $string_value

    $string_value.each {|element| 
      if $pairs_hash[element] == nil 
        $numbered_value.push(element)
      else 
        $numbered_value.push($pairs_hash[element])
      end }
    p $numbered_value

    $numbered_value.each {|element| 
      if element.is_a?(String)
        $chiphered_value.push(element)
      elsif  (element - $shift_value <= 0)
        $chiphered_value.push($shift_value_negative + element)
        else 
        $chiphered_value.push(element - $shift_value)
        end
    p $chiphered_value
}
  end
  
string_conversion_to_numbers


def get_chiphered 

  $chiphered_value.each {|element|
    if element.is_a?(String)
      $chiphered_array.push(element)
    else
  $chiphered_array.push($pairs_hash.invert[element])
    end}
p $chiphered_array

$chiphered_array = $chiphered_array.join
p $chiphered_array
end

get_chiphered



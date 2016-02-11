require 'pry'

def separator(redirect_from, redirect_to)
  t_array = redirect_from.split("/")[2..-1]
  f_array = redirect_to.split("/")[2..-1]

  t_platform = t_array[0].split(".")[0]
  f_platform = f_array[0].split(".")[0]
  t_product = t_array[2]
  t_medium = t_array[4]
  f_medium = f_array[2]
  t_offer_rn = t_array[5][2..-1]
  f_offer_rn = f_array[3][2..-1]

  f_offer_i = roman_numeral_to_int(f_offer_rn)
  t_offer_i = roman_numeral_to_int(t_offer_rn)
  binding.pry
end



def roman_numeral_to_int(r_num)
  count = 0
  offnums = {
    iv: 4,
    ix: 9,
    xiv: 14,
    xix: 19,
    xxiv: 24,
    xxix: 29,
    xxxiv: 34,
    xxxix: 39,
    xliv: 44,
    xlix: 49,
    liv: 54,
    lix: 59
  }
  if offnums.keys.include? r_num.to_sym
    count += offnums[r_num.to_sym]
  else
    r_num.chars.each do |letter|
      count += 50 if letter.downcase == "l"
      count += 10 if letter.downcase == "x"
      count += 5 if letter.downcase == "v"
      count += 1 if letter.downcase == "i"
    end
  end
  return count
end






separator("http://direct.ninjakitchen.com/products/nutri-ninja-ninja-blender-duo-bl640/4/cpc/ngxviii/", "http://duo.ogt/4/cpc/ngxix/")

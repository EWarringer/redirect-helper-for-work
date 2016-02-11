require "pry"

class Separator

  attr_accessor :script_url, :from_offer_i, :offer_i, :platform, :from_platform, :product, :medium, :from_medium, :offer_rn, :from_offer_rn

  def initialize(redirect_from, redirect_to)
    to_array = redirect_from.split("/")[2..-1]
    from_array = redirect_to.split("/")[2..-1]

    @platform = to_array[0].split(".")[0]
    @product = to_array[2]
    @medium = to_array[4]
    @offer_rn = to_array[5][2..-1]
    @offer_i = offer_integer(offer_rn)
    @from_platform = from_array[0].split(".")[0]
    @from_medium = from_array[2]
    @from_offer_rn = from_array[3][2..-1]
    @from_offer_i = offer_integer(from_offer_rn)
  end

  def offer_integer(r_num)
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

  # def script_url
  #   platform
  # end
end

hello = Separator.new("http://direct.ninjakitchen.com/products/nutri-ninja-ninja-blender-duo-bl640/4/cpc/ngxviii/", "http://duo.ogt/4/cpc/ngxix/")

binding.pry

require 'pry'

class CreditCard
  def initialize(card_number, exp_date, ccv, name, zip)
    @card_number = card_number
    @exp_date = exp_date
    @ccv = ccv
    @name = name
    @zip = zip
  end

  # def valid_num?
  #   card_number_array = @card_number.chars.reverse
  #   if card_number_array.length != 16
  #     return false
  #   end
  # end

#Reverse the digits in the credit card number
#pick the odd digits out of the reversed credit card number and put them in an array
#sum the resultant 'odd' digits and save that value as =sum1
#pick the even digits out of the reversed credit card number and put them in an arry
#multiple each of the digits in the even_digits array *2
#convert this array into characters and then into an array of indv_even_digits
#sum all the digits in the array indv_even_digits and save that value as =sum2
#if sum1 + sum2 = 70, you have passed the Luhn test


    # int_ary = card_number_array.map { |x| x.to_i }
    #   card_number_array.each_index do |x|
    #     card_number_array[x] = card_number_array[x].to_i
    #     if x % 2 != 0
    #       card_number_array[x] * 2
    #       if card_number_array[x] > 9
    #         card_number_array[x] - 9
    #       end
    #     end
    #  (card_number_array.reduce(:+) + last_digit) % 10 == 0
    #   end


  def valid_zip?
    @zip.length == 5
  end

  def valid_exp?
    @exp_date - Time.now > 0
  end

  def card_type?
    card_type = "Other"
     if @card_number.slice(0..1).eql?("34") || @card_number.slice(0..1).eql?("27")
       card_type = "American Express"
     elsif @card_number[0].eql?("4")
      card_type = "Visa"
     elsif @card_number.slice(0..3).eql?("6101")
       card_type = "Discover"
     elsif @card_number.slice(0..1).eql?("51") || @card_number.slice(0..1).eql?("52") || @card_number.slice(0..1).eql?("53") || @card_number.slice(0..1).eql?("54") || @card_number.slice(0..1).eql?("55")
       card_type = "Master Card"
      end
  end
end

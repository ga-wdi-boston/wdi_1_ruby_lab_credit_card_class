require 'pry'

class CreditCard
  def initialize(card_number, exp_date, cvv, name, zip)
    @card_number = card_number
    @exp_date = exp_date
    @cvv = cvv
    @name = name
    @zip = zip
  end

  def valid_num?
  	binding.pry
    if @card_number.length != 16
      return false
    else
      card_number_array = @card_number.chars
      last_digit = card_number_array.pop.to_i
      int_array = card_number_array.reverse.map { |integer| integer.to_i }
      int_array_odd = int_array

      int_array_odd.map! { |integer| integer * 2 }
      int_array_odd.map! do |integer|
        if integer > 9
          integer - 9
        else
          integer
        end
      end
    end
    sum = int_array_odd.reduce(:+) + int_array_even.reduce(:+)
    if (sum + last_digit) % 10 == 0
      return true
    else
      return false
    end
  end

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
      card_type = "MasterCard"
    end
  end
end

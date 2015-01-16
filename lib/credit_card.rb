require 'date'

class CreditCard
  def initialize(card_number, exp_date, ccv, name, zip_code)
    @card_number = card_number
    @exp_date = exp_date
    @ccv = ccv
    @name = name
    @zip_code = zip_code
  end

  def luhn
    card_num_array = @card_number.to_s.chars

    card_num_array.map do |x|
      if x.to_i%2 != 0
        product = x.to_i * 2
          if product > 9
            card_sum_array = product.to_s.chars
            card_sum_array.map do |y|
              y.to_i
            end.inject(:+)
          else
            product
          end
      else
          x.to_i
      end
    end.inject(:+)

  end

#returns true if expired
  def expired?
    Date.new(@exp_date) - Date.today < 0
  end

  def card_type
    # American Express. First digit must be a 3 and second digit must be a 4 or 7. Valid length: 15 digits.
    if @card_number.to_s[0] = "3" &&
      (@card_number.to_s[1].to_s = "4" ||
      @card_number.to_s[1].to_s = "7") &&
      @card_number.to_s.length == 15
      card_type = "American Express"
    # Mastercard/First digit must be a 5 and second digit must be in the range 1 through 5 inclusive
    elsif @card_number.to_s[0] = "5" &&
      (@card_number.to_s[1] >= 1 &&
      @card_number.to_s[1] <= 5) &&
      @card_number.to_s.length == 16
      card_type = "Mastercard"
    # Visa/First digit must be a 4. Valid length: 13 or 16 digits.
    elsif @card_number.to_s[0] = "4" &&
      (@card_number.to_s.length == 13 ||
      @card_number.to_s.length == 16)
      card_type = "Visa"
    # Discover/ Valid length: 16 digits. First 8 digits must be in one of the following ranges:60110000 through 60119999, 65000000 through 65999999, 62212600 through 62292599
    elsif
      (@card_number.to_s[0..7].to_i >= 60110000 &&
      @card_number.to_s[0..7].to_i <= 60119999) ||

      (@card_number.to_s[0..7].to_i >= 65000000 &&
      @card_number.to_s[0..7].to_i <= 65999999) ||

      (@card_number.to_s[0..7].to_i >= 62212600 &&
      @card_number.to_s[0..7].to_i <= 62292599)

      @card_number.to_s.length == 16
      card_type = "Discover"
    else
      card_type = "Other"
    end
  end

  def valid?
    if @card_number.to_s.length == 15
      card_type = "American Express"
    elsif @card_number.to_s.length == 16
      card_type = "Mastercard"
    elsif (@card_number.to_s.length == 13 ||
      @card_number.to_s.length == 16)
      card_type = "Visa"
    elsif @card_number.to_s.length == 16
      card_type = "Discover"
    else
      card_type = "Other"
   end &&
    @name != "" &&
    @zip_code.to_s.length == 5 &&
    expired? &&
    luhn%10 == 0
  end

end



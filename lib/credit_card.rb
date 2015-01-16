require 'date'

class CreditCard

  def initialize(card_number, expiration, ccv, name, zip_code)
    @card_number = card_number
    @expiration = DateTime.parse(expiration.to_s)
    @ccv = ccv
    @name = name
    @zip_code = zip_code
  end

  def is_valid?
    if @card_number == nil
      return false
    elsif @expiration == nil
      return false
    elsif @ccv == nil
      return false
    elsif @name == nil
      return false
    elsif @zip_code == nil
      return false
    else
      return true
    end
  end

  def get_todays_date
    @today = DateTime.now
  end

  def expired_card?
    (@expiration - @today) > 0
  end

  def card_type
    case @card_number.to_s.chars[0]
      when '4'
        'Visa'
      when '5'
        'Mastercard'
      when '6'
        'Amex'
      else
        false
    end
  end

# My formula is wrong here but it was pretty late when I figured it out and then I was getting some seriously wrong stuff so I commented out the "new" code and left what I had written.
#
# The formula that I though I was going for below is
#
# Double every 2nd number going backwards
# If the number is greater than 9, add those 2 numbers (of the total) together
# Once you have the new array of the modified even numbers and the original odd numbers,
# add all of the numbers together
# Then run module 10 on it. If you get back a 0, it would return "true", if not, return "false"
# The Luhn algo is different than this, so clearly checking the credit card against this wouldn't
# return the correct thing, but I wanted you guys to see the work I'd done anyway.

  def luhn_algo_valid?
        # new_array = []
    # # @card_number.to_s.chars.reverse.map do |item|
    # @card_number.to_s.chars.map do |item|
    #   if count == 0
    #     count += 1
    #     if item.to_i * 2 > 9
    #       num = (item.to_i * 2).to_s.chars
    #       item = (num[0].to_i + num[1].to_i).to_i
    #     else
    #       item = (item.to_i * 2).to_i
    #       new_array.push(item.to_i)
    #     end
    #   else
    #     count = 0
    #   end
    # end
    # @card_number = 79927398711
    count = 0

    total_modulo = @card_number.to_s.chars.reverse.map do |item|
      if count == 0
        count += 1
        if item.to_i * 2 > 9
          num = (item.to_i * 2).to_s.chars
          item = (num[0].to_i + num[1].to_i).to_i
        else
          item = (item.to_i * 2).to_i
        end
      else
        count = 0
        item.to_i
      end
    end.reduce(:+)
    total_modulo % 10 == 0
  end

end


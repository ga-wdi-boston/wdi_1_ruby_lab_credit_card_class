require 'date'
require 'byebug'
class CreditCard
  def initialize (number, exp_month, exp_year, ccv, name, zip_code)
    @number = number
    @exp_month = exp_month
    @exp_year = exp_year
    @ccv = ccv
    @name = name
    @zip_code = zip_code
  end

  def number
    @number = number
  end

  def exp_month
    @exp_month = exp_month
  end

  def exp_year
    @exp_year = exp_year
  end

  def ccv
    @ccv = ccv
  end

  def name
    @name = name
  end

  def zip_code
    @zip_code = zip_code
  end

  def is_valid
    @number.to_s.length == 16 && @zip_code.to_s.length == 5 && @name != nil
  end

  def date_is_valid
    if @exp_year == Date.today.strftime("%y").to_i
         @exp_month > Date.today.strftime("%m").to_i
    else
         @exp_year > Date.today.strftime("%y").to_i
    end
  end

  def luhn_validity
    digits = @number.to_s.scan(/./).map(&:to_i)
    check = digits.pop
    sum = digits.reverse.each_slice(2).map do |x, y|
      [(x * 2).divmod(10), y || 0]
    end.flatten.inject(:+)
    luhn_validity =(10 - sum % 10) == check
    luhn_validity
  end

  def card_type
    if @number.to_s.split("")[0] == "4"
      card_type = "Visa"
    elsif @number.to_s.split("")[0] == "5"
      card_type = "Mastercard"
    elsif @number.to_s.split("")[0] == "6"
      card_type = "Discover Card"
    elsif @number.to_s.split("")[0] == "3"
      card_type = "American Express"
    else
      card_type = "Unknown Card Type"
    end
    card_type
  end

end

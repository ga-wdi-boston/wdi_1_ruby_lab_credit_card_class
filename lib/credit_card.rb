require 'date'

class InvalidExpDate < ArgumentError
end

class CreditCard

  def initialize(number, exp_date, ccv, name, zip)
    @number = number
    @exp_date = exp_date.to_s
    @ccv = ccv.to_s
    @name = name
    @zip = zip.to_s
  end

  def number
    @number
  end

  def name
    @name
  end

  def zip
    @zip
  end

  def exp_date
    @exp_date
  end

  def valid_cc_number?
    @number.to_s.length == 13 ||
    @number.to_s.length == 15 ||
    @number.to_s.length == 16
  end

  def valid_zip?
    @zip.length == 5
  end

  def valid_name?
    return true if defined? @name
  end

  def valid_exp_date?
    expiration_date = Date.parse(@exp_date)
    today = DateTime.now
    (expiration_date - today) > 0
  end

  def card_type
    if number.to_s[0] == "4" &&
      (number.to_s.length == 13 ||
       number.to_s.length == 16)
      card_type = "Visa" #works
    elsif number.to_s[0] == "3" &&
        (number.to_s[1] == "4" ||
        number.to_s[1] == "7") &&
        number.to_s.length == 15
        card_type =  "AmEx" #works
    elsif number.to_s[0] == "5" &&
       (number.to_s[1].to_i >= 1 &&
       number.to_s[1].to_i <= 5) &&
       number.to_s.length == 16
       card_type =  "MasterCard" #works
    elsif (number.to_s[0..7].to_i >= 60110000 &&
      number.to_s[0..7].to_i <= 60119999) ||
      (number.to_s[0..7].to_i >= 65000000 &&
      number.to_s[0..7].to_i <= 65999999) ||
      (number.to_s[0..7].to_i >= 62212600 &&
      number.to_s[0..7].to_i <= 62292599)
      number.to_s.length == 16
      card_type =  "Discover" #works
    else
      return "Invalid Card"
    end
  end

  def luhn_validity
    # I am still working to create a working solution of this. I know that essentially I need to double every other digit (and if the product of doubling those digits is greater than 9, I have to sum the digits of the products), then I need to sum all of the digits, and then figure out if the total modulo 10 is equal to 0 (if the total ends in zero)
    digits = number.to_s
    array = digits.split('').map(&:to_i)
    last_digit = array.pop
    product = array.reverse.unshift(0).select.each_with_index { |str, i| i.odd? }
    twice = product.map{|x| x * 2}
    twice.map{|n| n - 9 if n > 9}
    difference1 = twice.reject{|x| x > 9}
    difference2 = twice.reject{|x| x < 9}
    difference = difference1.map{|n| n -9}
    differences = difference + difference1
    sum1 = differences.map(&:to_i)
    sum2 = array.reverse.unshift(0).select.each_with_index { |str, i| i.even? }
    sum = sum1 + sum2
    total = sum.inject(&:+)
    remainder = total % 10
    valid = 10 - remainder
    return valid
  end


end


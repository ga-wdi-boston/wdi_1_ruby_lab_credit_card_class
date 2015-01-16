require 'date'
require 'pry'

class CreditCard
  def initialize(number, exp_month, exp_year, cvv, name, zip)
    @number = number
    @exp_month = exp_month
    @exp_year = exp_year
    @cvv = cvv
    @name = name
    @zip = zip
  end

  def number
    @number
  end

  def exp_month
    @exp_month
  end

  def exp_year
    @exp_year
  end

  def cvv
    @cvv
  end

  def name
    @name
  end

  def zip
    @zip
  end

  def valid?
    # Checks the validity of the credit card number length, zip length and name
    first = number.to_s.length == 16 && @zip.to_s.length == 5 && name.is_a?(String)

    # Checks that the expiration date is still valid
    month = exp_month.scan(/[\d]{1,2}/)
    year = exp_year.scan(/[\d]{4}/)
    exp_date = Date.new(year[0].to_i,month[0].to_i)
    now = DateTime.now
    check = now <=> exp_date
    check == -1 ? second = true : second = false


    #Applies Luhms Theorum
    digits = number.to_s.scan(/./).map(&:to_i)
    sum = digits.reverse.each_slice(2).map do |x, y|
      [(x * 2).divmod(10), y || 0]
    end.flatten.inject(:+)


    third = (sum % 10) == 0

    # Checks to see that all three three separate blocks of code evaluate to true
    first && second && third
  end

  def card_type
    if number.to_s.split("")[0] == "4"
      type = "visa"
    elsif number.to_s.split("")[0] == "5"
      type = "mastercard"
    elsif number.to_s.split("")[0] == "3"
      type = "amex"
    elsif number.to_s.split("")[0] == "6"
      type ="discover"
    else
      type = "counterfit"
    end
  end
end

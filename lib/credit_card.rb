require 'date'

class CreditCard
  attr_accessor :cc_num, :exp_date, :ccv, :name, :zip

  def initialize(cc_num, exp_date, ccv, name, zip)
    @cc_num = cc_num
    @exp_date = exp_date
    @ccv = ccv
    @name = name
    @zip = zip
  end

  def card_type
    if @cc_num.to_s.chars[0] == '3'
      "Amex"
    elsif @cc_num.to_s.chars[0] == '4'
      "Visa"
    elsif @cc_num.to_s.chars[0] == '6'
      "Discover"
    elsif @cc_num.to_s.chars[0] == '5'
      "MasterCard"
    end
  end

  def valid_num?

  digits = @cc_num.to_s.chars.map(&:to_i)
  check = digits.pop

  sum = digits.reverse.each_slice(2).map do |x, y|
    [(x * 2).divmod(10), y || 0]
  end.flatten.inject(:+)

  (10 - sum % 10) == check
  end

  def valid?(arg)
    @cc_num.to_s.length == 16
    @exp_date > Date.today
    @ccv.to_s.length == 3
    @name
    @zip.to_s.length == 5
  end
end

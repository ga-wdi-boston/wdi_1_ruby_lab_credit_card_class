require 'date'

class CreditCard
  def initialize (card_number, expiration, ccv, name, billing_zip)
    @card_number = card_number
    @expiration = expiration
    @ccv = ccv
    @name = name
    @billing_zip = billing_zip
  end


  def card_valid?
  credit_card_valid? && expiration_valid? && expiration_valid? && ccv? && name? && billing_zip? && card_type != "Invalid Card"
  end

  def credit_card_valid?
    digits = @card_number.chars.map(&:to_i)
    check = digits.pop

    sum = digits.reverse.each_slice(2).map do |x, y|
      [(x * 2).divmod(10), y || 0]
    end.flatten.inject(:+)

    (10 - sum % 10) == check
  end

  def expiration_valid?
    (Date.parse(@expiration) - DateTime.now) > 0
  end

  def ccv?
    @ccv.length == 3 && @ccv.to_i > 0
  end

  def name?
    @name.is_a? String
  end

  def billing_zip?
    @billing_zip.length == 5 && @billing_zip.to_i > 0

  end


  def card_type
    length = @card_number.length
    if length == 15 && @card_number =~ /^(34|37)/
      "Amex"
    elsif length == 16 && @card_number =~ /^(5[1-5])/
      "MasterCard"
    elsif length == 13 || length == 16 && @card_number =~ /^4/
      "Visa"
    else
      "Invalid Card"
    end
  end

end #CreditCard end

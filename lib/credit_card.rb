class CreditCard

  def initialize(ccnum, expiration, ccv, name, billzip)
    @ccnum = ccnum
    @expiration = expiration
    @ccv = ccv
    @name = name
    @billzip = billzip
  end
  def valid?(ccnum, expiration, ccv, name, billzip)
    if ccnum.length = 15, 16
      true
  end
  def card_type
    length = @ccnum.size
    if length == 15 && @ccnum =~ /^(34|37)/
      "AMEX"
    elsif length == 16 && @ccnum =~ /^6011/
      "Discover"
    elsif length == 16 && @ccnum =~ /^5[1-5]/
      "MasterCard"
    elsif (length == 13 || length == 16) && @number =~ /^4/
      "Visa"
    else
      "Unknown"
    end
  end
end


class CreditCard
  
  def initialize(name, number, expiration, ccv, zip)
    @name = name
    @number = number
    @expiration = expiration
    @ccv = ccv
    @zip = zip
  end

  def name
    @name
  end

  def number
    @number
  end

  def valid_number
    if number.length == 16
      return true
    else
      return false
    end
  end

  def expiration
    @expiration
  end

  def ccv
    @ccv
  end

  def zip
    @zip
  end
  

  #def valid?  checks the validity of the credit card. Check that it has a name, proper length zip code, 16-digit number and an expiration date in the future.
end


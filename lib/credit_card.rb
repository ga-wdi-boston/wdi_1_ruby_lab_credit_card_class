class CreditCard
  def initialize(name, zip, card_number, expiration, ccv)
    @name = name
    @zip = zip
    @card_number = card_number
    @expiration = expiration
    @ccv = ccv
  end

  def name
    @name
  end

  def zip
    @zip
  end

  def card_number
    @card_number
  end

  def expiration
    @expiration
  end

  def ccv
    @ccv
  end


end

class CreditCard

  def initialize(number, expiration_date, ccv, name, zip)
    @number = number
    @exp_date = expiration_date
    @ccv = ccv
    @name = name
    @zip = zip
  end

  def has_name?(name) # the return for this needs to be true
    # does my card has a name
    # yes == true
    # no == false
  end
  def zip_length(zip)

   @zip.length.to_i == 5
   true

  end
end

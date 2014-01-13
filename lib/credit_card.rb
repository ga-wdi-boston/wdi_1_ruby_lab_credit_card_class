class CreditCard
  attr_accessor :card_number, :exp_date, :ccv, :cardholder_name, :billing_zip_code

  def initialize
    @exp_date = exp_date
    @ccv = ccv
    @cardholder_name = cardholder_name
    @billing_zip_code = billing_zip_code
  end

  def valid?
    @card_number.to_s.length = 16
    @billing_zip_code.to_s.length = 5
    @exp_date <=> Date.current
    @name = name
  end
end

class CreditCard
  attr_accessor :number, :exp_date, :ccv, :name, :billing_zip

  def initialize(number, exp_date, ccv, name, billing_zip)
    @number = number
    @exp_date = exp_date
    @ccv = ccv
    @name = name
    @billing_zip = billing_zip
  end

  def valid?
    @number.length == 15 && @number.to_i != 0 &&
    @exp_date.length == 5 && @exp_date[0,2].to_i <= 12 && @exp_date[-2,2].to_i <= 31 &&
    @ccv.length == 3 && @ccv.to_i != 0 &&
    @name.split.count == 2 &&
    @billing_zip.length == 5
  end

end

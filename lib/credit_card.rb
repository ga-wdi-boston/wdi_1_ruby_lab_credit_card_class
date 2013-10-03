class CreditCard
  attr_accessor :num, :exp, :ccv, :name, :zip
  def initialize(num, exp, ccv, name, zip)
    @num  = num
    @exp  = exp
    @ccv  = ccv
    @name = name
    @zip  = zip
  end

  def valid?
    return false if @num.size != 16

    date_string = @exp.to_s
    month = date_string[0,2].to_i
    year = date_string[2,2].to_i
    now = Time.new

    if year < now.year
      return false
    elsif year == now.year && month < now.month
      return false
    end

    return false if @name.length < 1
    return false if @zip.length != 5
  end

  def card_type
    stringify = @num.to_s
    return "American Express" if stringify[0,2] == "34" || stringify[0,2] == "37"
    return "Visa" if stringify[0] == "4"
    return "Discover" if stringify[0,4] == "6011"
    "Other"
  end
end

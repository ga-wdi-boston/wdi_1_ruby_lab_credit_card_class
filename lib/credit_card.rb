class CreditCard
  attr_reader :number, :expiration, :verification, :name, :zip_code

  def initialize(number, expiration, verification, name, zip_code)
    @number = number
    @expiration = expiration
    @verification = verification
    @name = name
    @zip_code = zip_code
  end

  def valid?
    !@name.empty? && @zip_code.length == 5 && @number.length == 16 && !expired?
  end

  private

  def expired?
    # This is somewhat of a hack, and only checks the year, not the month.
    # How could we improve it?
    @expiration[3,2].to_i < (Time.now.year.to_i - 2000)
  end
end

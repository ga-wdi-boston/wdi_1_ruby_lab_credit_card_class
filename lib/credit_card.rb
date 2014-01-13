class CreditCard

	attr_accessor :number, :exp, :cvv, :name, :zipcode

	def initialize(number, exp, cvv, name, zipcode)
		@number = number
		@exp = exp
		@cvv = cvv
		@name = name
		@zipcode = zipcode
	end

	def valid?
		!@name.empty? && @zipcode.length == 5 && number.length == 16 && !expired?
	end

	def expired?
		@exp[3,2].to_i < (Time.now.year.to_i - 2000)
	end

end



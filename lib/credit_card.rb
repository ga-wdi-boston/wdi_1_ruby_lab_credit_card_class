require 'pry'

class CreditCard

	attr_accessor :number, :exp_date, :ccv, :name, :billing_zip_code

	def initialize(number, exp_date, ccv, name, billing_zip_code)
		@number = number
		@exp_date = exp_date
		@ccv = ccv
		@name = name
		@billing_zip_code = billing_zip_code
	end

	def valid?
		if
			self.number.to_s.split(//).count == 16
			return true
		else
			return false
		end
	end

end

# credit_card = CreditCard.new(1111111111111111,0612,701,"Anna Tsykalova", 02144)

# binding.pry

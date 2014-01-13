class CreditCard
	attr_accessor :number, :expiration_date, :cvv, :name, :zip_code

	def initialize
		@number = credit_card_number
		@expiration_date = expiration_date
		@cvv = cvv
		@name = name
		@zip_code = zip_code.to_s
	end

	def valid?
		if @name = name
		 return true
		else
			return false
		end

		if @zip_code.length = 5
			return true
		else
			return false
		end

		if @number.length = 16
			return true
		else
			return false
		end

		if @expiration_date > Time.now.strftime("%m/%Y")
			return true
		else
			return false
		end
	end
end

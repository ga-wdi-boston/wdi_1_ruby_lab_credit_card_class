class CreditCard
	attr_accessor :credit_card_nub, :expiration_date, :ccv, :Name, :billing_zip_code
	
	def initialize(credit_card_num, expiration_date, ccv, name, billing_zip_code)
		@credit_card_num = credit_card_num
		@expiration_date = expiration_date
		@ccv = ccv
		@name = name
		@billing_zip_code = billing_zip_code
	end

	def valid?
		if @credit_card_num.length != 16
			return false
		end

		if @expiration_date.length != 4
			return false
		end

		if @ccv.length != 3
				return false
		end

		if @name == nil
			return false
		end

		if @billing_zip_code != 5
			return true
		end
		puts "The credit card is valid"
		return true
	end
end
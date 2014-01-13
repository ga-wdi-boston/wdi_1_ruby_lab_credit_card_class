


# Credit card # (16-digits)
# Expiration Date (two digit month, two digit year)
# CCV (3 digit number on the back)
# Name
# Billing Zip Code (5-digits)

class CreditCard
		attr_accessor :name, :credit_card_number, :expiration_date, :ccv, :billing_zip

		def initialize
		 @name = name
		 @credit_card_number = credit_card_number
		 @expiration_date = expiration_date
		 @billing_zip = billing_zip
		 @ccv = "#{rand(1..10)}"+"#{rand(1..10)}" + "#{rand(1..10)}"

		end

		def is_valid?
			if @name = name && @credit_card_number = credit_card_number && @expiration_date = expiration_date && @billing_zip = billing_zip && @ccv = "#{rand(1..10)}"+"#{rand(1..10)}" + "#{rand(1..10)}"
				return true
			else
				return false
		end
	end
end

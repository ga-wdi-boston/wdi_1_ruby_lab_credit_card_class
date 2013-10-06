require 'pry'

class String

  	def validate(regex)
    	!self[regex].nil?
  	end

end

class CreditCard

	attr_accessor :number, :expiration, :ccv, :name, :zip

	def initialize(number, expiration, ccv, name, zip)
		@number = number.to_s
		@expiration = expiration.to_s
		@ccv = ccv.to_s
		@name = name.to_s
		@zip = zip.to_s
	end

	def valid_number
		@number.validate(/\d{16}/)
	end

	def has_name
		@name.validate(/[a-zA-Z]{1,}/)
	end

	def valid_zip
		@zip.validate(/\b(\d{5})\b/)
	end

	def valid_date
		@expiration.validate(/^\d{2}\/\d{2}$/)
	end

	def valid?
		valid_number && has_name && valid_zip && valid_date
	end

end

card = CreditCard.new("1234567890123456", "09/14", "333", "Blake Ruddock", "06832")

# binding.pry



# - Credit card # (16-digits)
# - Expiration Date (two digit month, two digit year)
# - CCV (3 digit number on the back)
# - Name
# - Billing Zip Code (5-digits)

# It should have the following methods: 

# - `initialize` - Used for creating a new credit card. 
# - `valid?` - This checks the validity of the credit card. Check that it has a name, 
# proper length zip code, 16-digit number and an expiration date in the future. 
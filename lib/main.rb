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
		number_array = @number.chars
		number_array.reverse!
		@odd_numbers = 0
		@even_numbers = 0

		number_array.each_with_index do |number, index|
			##odd indices, even numbers
			if index % 2 == 1
				double = number.to_i * 2
					if double > 9
						numbers = double.to_s.chars
						numbers.each {|x| @even_numbers += x.to_i }
					else 
						@even_numbers += double
					end
			#even indices, odd numbers
			else 
				@odd_numbers += number.to_i
			end

		end

		sum = @odd_numbers + @even_numbers
		return sum % 10 == 0

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


card = CreditCard.new("375421657316548", "09/14", "333", "Blake Ruddock", "06832")


puts card.valid_number


# - Credit card # (16-digits)
# - Expiration Date (two digit month, two digit year)
# - CCV (3 digit number on the back)
# - Name
# - Billing Zip Code (5-digits)

# It should have the following methods: 

# - `initialize` - Used for creating a new credit card. 
# - `valid?` - This checks the validity of the credit card. Check that it has a name, 
# proper length zip code, 16-digit number and an expiration date in the future. 
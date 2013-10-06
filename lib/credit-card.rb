require 'pry'

class CreditCard
	attr_accessor :number, :expiration_date, :ccv, :name, :zip_code

	def initialize(number, expiration_date, ccv, name, zip_code)
		@number = number.to_s
		@expiration_date = expiration_date.to_s
		@ccv = ccv.to_s
		@name = name
		@zip_code = zip_code.to_s
		if valid? != true
			return valid?
		end
	end

	def valid?
		if @number.length != 16
			return "Error: Card number is not 16 digits long."
		elsif expired? == true
			return "Error: Card is expired."
		elsif @name.class != String
			return "Error: not a valid name."
		elsif @zip_code.length != 5
			return "Error: zip code invalid."
		else
			return true
		end

	end

	def expired?
		exp_date = Date.parse(@expiration_date)
		now = Time.now.to_s
		today = Date.parse(now)
		if exp_date < today
			return true
		else 
			return false
		end
	end
end

require 'pry'

class CreditCard
	attr_accessor :number, :expiration_date, :ccv, :name, :zip_code

	def initialize(number, expiration_date, ccv, name, zip_code)
		@number = number.to_s
		@expiration_date = expiration_date.to_s
		@ccv = ccv.to_s
		@name = name
		@zip_code = zip_code.to_s
		valid?
	end

	def valid?
		if @number.length != 16
			return "Error: card number is not 16 digits long."
		elsif expired? == true
			return "Error: card is expired."
		elsif @name.class != String
			return "Error: not a valid name."
		elsif @zip_code.length != 5
			return "Error: zip code invalid."
		elsif valid_number? == false
			return "Error: invalid card number."
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

	def valid_number?

		step_1 = @number.reverse
		step_2 = step_1.split("")
		step_3 = step_2.map.with_index do |digit, index|
				if index % 2 == 1
				digit.to_i * 2
				else
				digit.to_i
				end
		end
		step_4 = step_3.map do |num| 
			num = num.to_s
			if num.length > 1
				arr = [num[0], num[1]]
			else 
				num
			end
		end
		step_5 = step_4.flatten
		step_6 = step_5.inject(0) do |sum, digit|
			sum += digit.to_i
		end
		if step_6 % 10 == 0
			return true
		else
			return false
		end
	end

end


# card = CreditCard.new(1234_5678_9012_3456, '1014', 623, "Matt Clement", 92143)





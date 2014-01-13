require 'date'
class CreditCard
	def initialize(card_num, exp_date, cvv, name, zip)
		if card_num.to_s.length != 16
			@card_num = "ERROR"
		else
			@card_num = card_num
		end
		@exp_date = exp_date
		@cvv = cvv
		@name = name
		@zip = zip
	end

	def valid?
		if (@card_num.to_s.length == 16) && @name
			exp_time = Time.parse @exp_date
			if exp_time > Time.new
				return true
			else
				return false
			end
			return false
		end
	end
end

puts CreditCard.new(1234567891234567, "12/15", 244, "Mike Stone", "02118").inspect

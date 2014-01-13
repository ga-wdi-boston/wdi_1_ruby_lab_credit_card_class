

class CreditCard

	attr_accessor :name, :number, :cvv, :exp_date, :zip

	def initialize(name, number, cvv, exp_date, zip)
		@name = name
		@number = number
		@exp_date = exp_date
		@zip = zip
		@cvv = cvv

	end


	def valid?(name, zip, number, exp_date)

	end

	def name_check
		return true if defined? @name
	end

	def zip_check
		return @zip.length == 5
	end

	def number_check
		return @number.to_s.length == 16
	end

	def date_check
	end


end



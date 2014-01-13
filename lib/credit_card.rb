class CreditCard
	attr_accessor :name, :number, :ccv, :name, :zip, :exp_date

	def initialize (number, exp_date, ccv, name, zip)
		@number = number.to_i
		@exp_date = exp_date.to_i
		@ccv = ccv.to_i
		@name = name.to_s
		@zip = zip.to_i
	end

	def valid?
		if @number.to_s.length == 16
			true
		end
	end


end


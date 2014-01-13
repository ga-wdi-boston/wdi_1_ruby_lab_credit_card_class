require 'time'
class CreditCard
	attr_reader :card_num, :exp_date, :cvv, :name, :zip
	def initialize(card_num, exp_date, cvv, name, zip)
		@card_num = card_num
		@exp_date = exp_date
		@cvv = cvv
		@name = name
		@zip = zip
	end

	def valid?
		!@name.empty? && @zip.length == 5 && @card_num.length == 16 && !expired?
	end

	def expired?
		@exp_date[-2,2].to_i <= (Time.new.year-2000)
	end

	def card_type
		'Visa' if @card_num.start_with?('4')
		'Amex' if @card_num.to_i.start_with?(51..55)
	end
end


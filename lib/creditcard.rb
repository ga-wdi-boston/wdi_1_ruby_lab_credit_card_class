require 'date'

class Credit_Card
	attr_accessor :credit_card_no, :expiration_date , :ccv, :name, :billing_zip_code
	def initialize(credit_card_no, expiration_date, ccv, name, billing_zip_code)
		@credit_card_no = credit_card_no
		@expiration_date = expiration_date
		@ccv = ccv
		@name = name
		@billing_zip_code = billing_zip_code
	end
	def valid?
		if (@name.exist? && @billing_zip_code.length == 5 && credit_card_no.length == 16 && expiration_date.split('/').to_a[1] > Time.new.to_a[5]) || (@name.exist? && @billing_zip_code.length == 5 && credit_card_no.length == 16 && expiration_date.split('/').to_a[1] == Time.new.to_a[5] && expiration_date.split('/').to_a[0] > Time.new.to_a[4])
			return true
		else return false
		end
	end
end


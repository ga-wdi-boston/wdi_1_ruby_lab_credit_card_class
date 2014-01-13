# The CreditCard class should have the following attributes:

# Credit card # (16-digits)
# Expiration Date (two digit month, two digit year)
# CCV (3 digit number on the back)
# Name
# Billing Zip Code (5-digits)
# It should have the following methods:

# initialize - Used for creating a new credit card.
# valid? - This checks the validity of the credit card. Check that it has a name, proper length zip code, 16-digit number and an expiration date in the future.


class CreditCard

	attr_accessor :card_num, :exp

	def initialize(card_num, exp)
		@card_num = card_num
		@exp = exp
	end

	def length(passin)
		passin.length
	end





end

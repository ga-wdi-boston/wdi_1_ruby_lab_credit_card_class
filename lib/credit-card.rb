require 'pry'

class CreditCard
	attr_accessor :number, :expiration_date, :ccv, :name, :zip_code

	def initialize(number, expiration_date, ccv, name, zip_code)
		@number = number
		@expiration_date = expiration_date
		@ccv = ccv
		@name = name
		@zip_code = zip_code 
		if valid? != true
			return "Error: your credit card"
		end
	end

	def valid?
		if @number.to_s.length != 16
			return "Error: Card number is not 16 digits long."
		elsif expired? == true
			return "Error: Card is expired."
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

d = Date.parse('3rd Feb 2001')
                             #=> #<Date: 2001-02-03 ...>
d.year                       #=> 2001
d.mon                        #=> 2
d.mday                       #=> 3
d.wday                       #=> 6
d += 1                       #=> #<Date: 2001-02-04 ...>
d.strftime('%a %d %b %Y')    #=> "Sun 04 Feb 2001"


# card = CreditCard.new(5463_2874_5678_0987, 0613, 623, "Matt Clement", 02143)

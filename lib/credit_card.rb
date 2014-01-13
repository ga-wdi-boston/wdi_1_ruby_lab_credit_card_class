	class CreditCard

		def initialize(card_number, expiration_date, cvv, name, zip_code)
			@card_number = card_number
			@expiration_date = expiration_date
			@cvv = cvv
			@name = name
			@zip_code = zip_code
		end


    def valid? (@name, @card_number, @zip_code, @expiration_date)
    	name = @name
    	zip_length = @zip_code.length == 5
    	card_number =
    		if @card_number.length == 16
    			puts "true"
    		else
    			puts "false"
    	expiration_date = @expiration_date #plus
    end



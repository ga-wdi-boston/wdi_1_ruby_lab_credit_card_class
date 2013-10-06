require 'pry'

class String

  	def validate(regex)
    	!self[regex].nil?
  	end

end

class CreditCard

	attr_accessor :number, :expiration, :ccv, :name, :zip

	def initialize(number, expiration, ccv, name, zip)
		@number = number.to_s
		@expiration = expiration.to_s
		@ccv = ccv.to_s
		@name = name.to_s
		@zip = zip.to_s
	end


	def valid_number
		number_array = @number.chars
		number_array.reverse!
		@odd_numbers = 0
		@even_numbers = 0

		number_array.each_with_index do |number, index|
			##odd indices, even numbers
			if index % 2 == 1
				double = number.to_i * 2
					if double > 9
						numbers = double.to_s.chars
						numbers.each {|x| @even_numbers += x.to_i }
					else 
						@even_numbers += double
					end
			#even indices, odd numbers
			else 
				@odd_numbers += number.to_i
			end

		end

		sum = @odd_numbers + @even_numbers
		return sum % 10 == 0
	end


	def card_type
		
		if @number[0..1] == "34" || @number[0..1] == "37"
			return "American Express"
		elsif @number[0] == "4"
			return "Visa"
		elsif @number[0..1] == "51" || @number[0..1] == "52" || 
			@number[0..1] == "53" || @number[0..1] == "54"  || 
			@number[0..1] == "55"
			return "MasterCard"
		else
			return "Other"
		end

	end


	def has_name
		@name.validate(/[a-zA-Z]{1,}/)
	end

	def valid_zip
		@zip.validate(/\b(\d{5})\b/)
	end

	def valid_date
		@expiration.validate(/^\d{2}\/\d{2}$/)
	end

	def valid?
		if valid_number && has_name && valid_zip && valid_date && (self.card_type != "Other")
			puts 'This is a valid ' + self.card_type + ' card!'
		elsif valid_number && has_name && valid_zip && valid_date && (self.card_type == "Other")
			puts 'This is a valid card, but the card type is not one of the three recognized types.'
		else
			puts "This is not a valid card!"
		end
	end

end


card = CreditCard.new("6011116929497996", "09/14", "333", "Blake Ruddock", "06832")


puts card.valid?
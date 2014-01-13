require 'spec_helper'
require_relative '../lib/credit_card.rb'

describe CreditCard do
	describe class
		it 'has a class called CreditCard'
			expect(class 'CreditCard').to eq true
		end
	end

	describe '#attr_accessor'
		it 'has attribute called number'
			expect(attr_accessor :number).to eq true
		end

		it 'has attribute called expiration_date'
			expect(attr_accessor :expiration_date).to eq true
		end

		it 'has attribute called name'
			expect(attr_accessor :name).to eq true
		end

		it 'has attribute called cvv'
			expect(attr_accessor :cvv).to eq true
		end

		it 'has attribute called zip_code'
			expect(attr_accessor :zip_code).to eq true
		end
	end

	describe '#valid?'
		it 'has a name that matches card'
			expect(@name).to eq name
		end

		it 'has a zip_code length of 5'
			expect(@zip_code).to eq 5
		end

		it 'has a credit card number length of 16'
			expect(@credit_card).to eq 16
		end

		it 'has expiration_date greater than today'
			expect(@expiration_date) > Time.now.strftime("%m/%Y").to eq true
		end
	end
end

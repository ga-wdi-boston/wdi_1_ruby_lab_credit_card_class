require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard do

	describe '#name_check' do

		it 'it returns true if there is a name' do

			jack = CreditCard.new('Jack', 34254, 555, '12/15', 01106)
			expect(jack.name_check).to eq true
		end
	end


	describe '#zip_check' do

		it 'it returns true if zip.length is 5' do

			jack = CreditCard.new('Jack', 34254, 555, '12/15', 01106)
			expect(jack.zip_check).to eq true
		end
	end

	describe '#number_check' do

		it 'it returns true if number.length is 16' do

			jack = CreditCard.new('Jack', 3425444444444444, 555, '12/15', 01106)
			expect(jack.number_check).to eq true
		end
	end

end

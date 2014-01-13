require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard do

	describe '#valid' do
		it 'checks to see if the credit card number has 16 digits' do
			credit_card = CreditCard.new(1111111111111111,0612,701,"Anna Tsykalova", 02144)
			expect (credit_card.valid?).to eq true
		end
	end

end

# I could use some help figuring out why this doesn't work :(

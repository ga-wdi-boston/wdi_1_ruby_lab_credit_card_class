
require 'spec_helper'
require_relative "../lib/credit_card"

describe CreditCard do

	describe '#initialize' do

		test_credit_card = CreditCard.new
		test_credit_card.name = "Jan"
		test_credit_card.credit_card_number = "1234567891234567"
		test_credit_card.expiration_date = "0118"
		test_credit_card.billing_zip = "03082"

		it 'initialize a new CreditCard instance' do
			expect(test_credit_card).to eq test_credit_card
		end
	end

	describe '#is_valid?' do

		test_credit_card = CreditCard.new
		test_credit_card.name = "Jan"
		test_credit_card.credit_card_number = "1234567891234567"
		test_credit_card.expiration_date = "0118"
		test_credit_card.billing_zip = "03082"

		it 'checks if the card is valid' do
			expect(test_credit_card.is_valid?).to eq true
		end
	end

end

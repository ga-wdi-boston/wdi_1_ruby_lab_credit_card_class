require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard do
	describe '#credi_card' do
		it 'Is the credit card number right'do
		creditcard = CreditCard.new( "1111222233334444", "1234", "521", 'Joe', "21609")
		expect(creditcard.valid?).to eq true
		end
	end
end
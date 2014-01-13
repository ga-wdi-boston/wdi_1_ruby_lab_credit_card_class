require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard  do

	it 'has 16 digits' do
		test1 = CreditCard.new('1234567890123456', '123')
		expect(test.length('1234567890123456').to eq 16
	end

	it 'has a 3 digit expiration date' do
		test2 = CreditCard.new('1234567890123456', '123')
		expect(test2.length('123')).to eq 3
	end



end


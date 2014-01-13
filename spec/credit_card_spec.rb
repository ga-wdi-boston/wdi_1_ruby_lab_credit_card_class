require 'spec_helper'
require_relative '../lib/creditcard'

decribe CreditCard do
	it 'should given a valid CreditCard' do
		CreditCard = CreditCard.new(1234567890123456, '08/16', 333, 'Jim', 12345)
		expect(CreditCard.valid?).to eq true
		CreditCard2 = CreditCard.new(1223, '04', 334, 'jj', 11)
		expect(CreditCard2.valid?).to eq false
	end
end

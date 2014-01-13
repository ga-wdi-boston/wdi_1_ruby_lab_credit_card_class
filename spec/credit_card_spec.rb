require 'spec_helper'
require_relative '../lib/creditcard'

describe Credit_Card do
	it 'should given a valid CreditCard' do
		CreditCard = Credit_Card.new(1234567890123456, '08/16', 333, 'Jim', 12345)
		expect(CreditCard.valid?).to eq true
	end
end

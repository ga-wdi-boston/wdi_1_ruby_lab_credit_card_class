require 'spec_helper.rb'
require_relative '../lib/credit_card'

describe CreditCard do
	describe '#initialize' do
		it 'should require a 16 digit credit card number' do
			credit_card = CreditCard.new(1234567891234567, "12/15", "244", "Mike Stone", "02118")
			expect(credit_card.instance_variable_get(:@card_num)).to eq 1234567891234567
		end
		it 'should return an error if credit card number is not 16 digits' do
			credit_card = CreditCard.new(12345678912567, "12/15", "244", "Mike Stone", "02118")
			expect(credit_card.instance_variable_get(:@card_num)).to eq "ERROR"
		end
		it 'should require an expiration date' do
			credit_card = CreditCard.new(1234567891234567, "12/15", "244", "Mike Stone", "02118")
			expect(credit_card.instance_variable_get(:@exp_date)).to eq "12/15"
		end
		it 'should require a CVV value' do
			credit_card = CreditCard.new(1234567891234567, "12/15", 244, "Mike Stone", "02118")
			expect(credit_card.instance_variable_get(:@cvv)).to eq 244
		end
		it 'should require a name' do
			credit_card = CreditCard.new(1234567891234567, "12/15", 244, "Mike Stone", "02118")
			expect(credit_card.instance_variable_get(:@name)).to eq "Mike Stone"
		end
		it 'should require an expiration date' do
			credit_card = CreditCard.new(1234567891234567, "12/15", 244, "Mike Stone", "02118")
			expect(credit_card.instance_variable_get(:@zip)).to eq "02118"
		end
	end
end

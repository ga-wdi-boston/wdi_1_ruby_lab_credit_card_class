require 'spec_helper.rb'
require_relative '../lib/credit_card'

describe CreditCard do
	describe '#initialize' do
		it 'assigns the credit card attributes' do
			credit_card = CreditCard.new('1234567891234567',
				"12/15",
				"244",
				"Mike Stone",
				"02118"
				)
			expect(credit_card.card_num).to eq '1234567891234567'
			expect(credit_card.exp_date).to eq "12/15"
			expect(credit_card.cvv).to eq '244'
			expect(credit_card.name).to eq 'Mike Stone'
			expect(credit_card.zip).to eq '02118'
		end
	end
	describe '#valid?' do
		it 'returns true if CC has a name' do
			valid_card = CreditCard.new('1234567891234567',
				"12/15",
				"244",
				"Mike Stone",
				"02118"
				)
			expect(valid_card).to be_valid
		end
		it 'returns false if the CC does not have a name' do
			invalid_card = CreditCard.new('1234567891234567',
				"12/15",
				"244",
				"",
				"02118"
				)
			expect(invalid_card).to_not be_valid
		end
		it 'returns false if the credit card ZIP code is not 5 digits' do
			invalid_card1 = CreditCard.new('1234567891234567', "12/15", "244", "Mike Stone", "0211")
			invalid_card2 = CreditCard.new('1234567891234567', "12/15", "244", "Mike Stone", "021101")
			invalid_card3 = CreditCard.new('1234567891234567', "12/15", "244", "Mike Stone", "")
			expect(invalid_card1).to_not be_valid
			expect(invalid_card2).to_not be_valid
			expect(invalid_card3).to_not be_valid
		end
		it 'returns false if the credit card number is not 16 digits' do
			invalid_card1 = CreditCard.new('12345678912567', "12/15", "244", "Mike Stone", "02118")
			invalid_card2 = CreditCard.new('1234567891244434567', "12/15", "244", "Mike Stone", "02118")
			invalid_card3 = CreditCard.new('', "12/15", "244", "Mike Stone", "02118")
			expect(invalid_card1).to_not be_valid
			expect(invalid_card2).to_not be_valid
			expect(invalid_card3).to_not be_valid
		end
		it 'returns false if the credit card has expired' do
			invalid_card = CreditCard.new('12345678912567', "12/15", "244", "Mike Stone", "02118")
		end
	end
end

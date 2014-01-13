require 'spec_helper'
require_relative '../lib/credit_card'


describe CreditCard  do
	describe '#initialize' do
		it 'assigns the credit card attributes' do
			credit_card = CreditCard.new(
				'1234567890123456',
				'11/15',
				'900',
				'Joe T. McAwesome',
				'02134'
				)

			expect(credit_card.number).to eq '1234567890123456'
			expect(credit_card.exp).to eq '11/15'
			expect(credit_card.cvv).to eq '900'
			expect(credit_card.name).to eq 'Joe T. McAwesome'
			expect(credit_card.zipcode).to eq '02134'

		end
	end


	describe '#valid?' do
		it 'returns true if the credit card has a name' do
			valid_card = CreditCard.new('1234567890123456', '11/15', '900', 'McAwesome', '02134')

			expect(valid_card.valid?).to be true
		end

		it 'returns false if the credit card does not have a name'	do
			invalid_card = CreditCard.new('1234567890123456', '11/15', '900', '', '02134')

			expect(invalid_card.valid?).to be false
		end

		it 'returns false unless the credit card zip is 5 digits' do
			invalid_card1 = CreditCard.new('1234567890123456', '11/15', '900', 'McAwesome', '0213')
			invalid_card2 = CreditCard.new('1234567890123456', '11/15', '900', 'McAwesome', '021341')
			invalid_card3 = CreditCard.new('1234567890123456', '11/15', '900', 'McAwesome', '')

			expect(invalid_card1).to_not be_valid
			expect(invalid_card2).to_not be_valid
			expect(invalid_card3).to_not be_valid
		end


		it 'returns false if the credit card has expired' do
			invalid_card = CreditCard.new('1234567890123456', '11/13', '900', 'McAwesome', '02134')

			expect(invalid_card).to_not be_valid

		end


	end 					# Ends describe #valid?

end 						# Ends describe CreditCard








require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard do
  describe '#initalize' do
    it 'assigns the credit card attributes' do
      credit_card = CreditCard.new(
        '42222222222222222222',
        '11/15',
        '900',
        'Joke-Explainer Jones',
        '02110'
      )

      expect(credit_card.number).to eq '42222222222222222222'
      expect(credit_card.expiration).to eq '11/15'
      expect(credit_card.verification).to eq '900'
      expect(credit_card.name).to eq 'Joke-Explainer Jones'
      expect(credit_card.zip_code).to eq '02110'
    end
  end

  describe '#valid?' do
    it 'returns true if the credit card is valid' do
      valid_card = CreditCard.new('4222222222222222', '11/15', '900', 'Jones', '02110')

      expect(valid_card).to be_valid
    end

    it 'returns false if the credit card does not have a name' do
      invalid_card = CreditCard.new('4222222222222222', '11/15', '900', '', '02110')

      expect(invalid_card).to_not be_valid
    end

    it 'returns false if the credit card ZIP code is not 5 digits' do
      invalid_card1 = CreditCard.new('4222222222222222', '11/15', '900', 'Jones', '0211')
      invalid_card2 = CreditCard.new('4222222222222222', '11/15', '900', 'Jones', '021101')
      invalid_card3 = CreditCard.new('4222222222222222', '11/15', '900', 'Jones', '')

      expect(invalid_card1).to_not be_valid
      expect(invalid_card2).to_not be_valid
      expect(invalid_card3).to_not be_valid
    end

    it 'returns false if the credit card number is not 16 digits' do
      invalid_card1 = CreditCard.new('422222222222222', '11/15', '900', 'Jones', '02110')
      invalid_card2 = CreditCard.new('42222222222222221', '11/15', '900', 'Jones', '02110')
      invalid_card3 = CreditCard.new('', '11/15', '900', 'Jones', '02110')

      expect(invalid_card1).to_not be_valid
      expect(invalid_card2).to_not be_valid
      expect(invalid_card3).to_not be_valid
    end

    it 'returns false if the credit card has expired' do
      invalid_card = CreditCard.new('4222222222222222', '11/13', '900', 'Jones', '02110')

      expect(invalid_card).to_not be_valid
    end
  end
end

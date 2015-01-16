require_relative '../lib/credit_card'

RSpec.describe CreditCard do

  let(:card_number) { 378282246310005 } # AmEx Card Example has 15 digits
  let(:exp_date) { 1/1/2016 }
  let(:ccv) { 123 }
  let(:name) { "Pat Needham" }
  let(:zip_code) { 12345 }


  subject(:credit_card) { CreditCard.new(card_number, exp_date, ccv, name, zip_code) }

  describe '#initialize' do
    it 'creates a new instance of a credit card with attributes' do
      expect(credit_card).to be_a CreditCard
    end
  end

# commenting this out since we now have logic built in the #valid method and test for different card companies
  # card_number has 16 digits
  # describe '#card_number' do
  #   it 'checks that credit card is only 16 digits' do
  #     expect(card_number.to_s.length).to eq 16
  #   end
  # end

  # ccv has 3 digits
  describe '#ccv' do
    it 'checks that ccv is only 3 digits' do
      expect(ccv.to_s.length).to eq 3
    end
  end

  # name filled out
  describe '#name' do
    it 'checks that name was completed' do
      expect(name).not_to eql ""
    end
  end

  # zip code 5 digit
  describe '#zip_code' do
    it 'checks that zip code is only 5 digits' do
      expect(zip_code.to_s.length).to eq 5
    end
  end

  # is card exipired?
  describe '#expired?' do
    it 'checks if card expired' do
      expect(credit_card.expired?).to eql true
    end
  end

  # passes luhn test?
  describe '#luhn' do
    it 'checks that credit card is valid from luhn test' do
      expect(credit_card.luhn % 10).not_to eq 0
    end
  end

  # credit card company
  describe '#card_type?' do
    it 'checks the card company' do
      expect(credit_card.card_type).to eql "American Express"
    end
  end

  # is valid?
  describe '#valid?' do
    it 'checks if card valid' do
      expect(credit_card.valid?).to eql true
    end
  end

end

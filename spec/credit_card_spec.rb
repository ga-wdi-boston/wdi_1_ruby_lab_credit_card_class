require_relative '../lib/credit_card'

RSpec.describe CreditCard do

  let(:card_number) { 9234567890123456 }
  let(:exp_date) { 1/15/2016 }
  let(:ccv) { 123 }
  let(:name) { "Pat Needham" }
  let(:zip_code) { 12345 }

  subject(:credit_card) { CreditCard.new(card_number, exp_date, ccv, name, zip_code) }

  describe '#initialize' do
    it 'creates a new instance of a credit card with attributes' do
      expect(credit_card).to be_a CreditCard
    end
  end

  #credit card has 16 digits---although valid method will allow exceptions to this depending on what American Express, Mastercard, Visa, and Discover allow
   describe '#card number' do
    it 'checks if credit card has 16 digits' do
      expect(card_number.to_s.length).to eq 16
    end
  end

  #ccv has 3 digits
  describe '#ccv' do
    it 'checks if ccv has 3 digits' do
      expect(ccv.to_s.length).to eq 3
    end
  end
  #name was given
  describe '#name' do
    it 'checks if name is given' do
      expect(name.length).not_to eql ""
    end
  end


  #zip code is 5 digits
  describe '#zip code?' do
    it 'checks if zip code has 5 digits' do
      expect(zip_code.to_s.length).to eq 5
    end
  end

   #tests validity of card_number using luhn value
  describe '#luhn%10' do
    it 'checks validity of card_number using luhn value' do
      expect(credit_card.luhn%10 == 0).to eq false
    end
  end

  #tests if card is expired
  describe '#expired?' do
    it 'checks if card is expired' do
      expect(credit_card.expired?).not_to eq false
    end
  end

  #validates whether card number passes luhn test
  #is valid
  describe '#luhn' do
    it 'checks with luhn test if card is valid' do
      expect(credit_card.luhn).to eq 71
    end
  end

  #validates whether card type is American Express, Mastercard, Visa, Discover, or Other
  describe '#card_type' do
    it 'checks whether the card type is American Express, Mastercard, Visa, Discover, or Other' do
      expect(credit_card.card_type).to eq "Other"
    end
  end

   describe '#valid?' do
    it 'checks if card is ultimately valid' do
      expect(credit_card.valid?).to eq false
    end
  end

end

require_relative '../lib/credit_card'

RSpec.describe CreditCard do

  let(:name) { "JJ Johnson" }
  let(:zip) { "02134" }
  let(:card_number) { 4024007166175140 }
  let(:expiration) { Time.new(2018, 8) }
  let(:ccv) { 123 }

  subject(:credit_card) { CreditCard.new(name, zip, card_number, expiration, ccv) }
  describe '#initialize' do
    it 'creates a new instance of CreditCard' do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#card_number' do
    it 'returns the value of @card_number' do
      expect(credit_card.card_number).to be card_number
    end
  end

  describe '#name' do
    it 'returns the value of @name' do
      expect(credit_card.name).to be name
    end
  end

  describe '#zip' do
    it 'returns the value of @zip' do
      expect(credit_card.zip).to be zip
    end
  end

  describe '#expiration' do
    it 'returns the value of @expiration' do
      expect(credit_card.expiration).to be expiration
    end
  end

  describe '#ccv' do
    it 'returns the value of @ccv' do
      expect(credit_card.ccv).to be ccv
    end
  end

  describe '#valid?' do
    it 'returns true if credit_card is valid, false if not' do
      expect(credit_card.valid?).to be true
    end
  end

  describe '#valid_name?' do
    it 'returns true if credit_card has a name, false if not' do
      expect(credit_card.valid_name?).to be true
    end
  end

  describe '#valid_zip?' do
    it 'returns true if @zip is the proper length, false if not' do
      expect(credit_card.valid_zip?).to be true
    end
  end

  describe '#valid_expiration?' do
    it 'returns true if @expiration is in the future, false if not' do
      expect(credit_card.valid_expiration?).to be true
    end
  end

  describe '#valid_card_number?' do
    it 'returns true if @card_number passes the Luhn algorithm' do
      expect(credit_card.valid_card_number?).to be true
    end
  end

  describe '#card_type' do
    it 'returns the name of the card issuer (e.g. Visa)' do
      expect(credit_card.card_type).to be 'Visa'
    end
  end

end

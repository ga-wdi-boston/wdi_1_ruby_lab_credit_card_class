require_relative '../lib/credit_card'

RSpec.describe CreditCard do
  # We use `let` for setting local variables
  let(:card_number) { "370619851809409" }
  let(:expiration) { "12/2015" }
  let(:ccv) {"300"}
  let(:name) {"McLovin"}
  let(:billing_zip) {"01245"}


  # Similarly, we use `subject` to create an instance
  # of the main object we are testing
  subject(:credit_card) { CreditCard.new(card_number, expiration, ccv, name, billing_zip) }


  describe '#initialize' do
    it 'creates a new instance of a CreditCard with a card number, expiration date, ccv, name and zip code' do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#credit_card_valid?' do
    it 'check to see if a card number is valid' do
      expect(credit_card.credit_card_valid?).to be true
    end
  end

    describe '#expiration_valid?' do
    it 'check if expiration is valid' do
      expect(credit_card.expiration_valid?).to be true
    end
  end

    describe '#ccv?' do
    it 'check if ccv is valid' do
      expect(credit_card.ccv?).to be true
    end
  end
    describe '#name?' do
    it 'check if name is valid' do
      expect(credit_card.name?).to be true
    end
  end
    describe '#billing_zip?' do
    it 'check if billing_zip is valid' do
      expect(credit_card.billing_zip?).to be true
    end
  end
    describe '#card_type' do
    it 'return a card type' do
      expect(credit_card.card_type).to eq "Amex"
    end
  end
    describe '#card_valid?' do
    it 'check to see if a card  is valid' do
      expect(credit_card.card_valid?).to be true
    end
  end
end

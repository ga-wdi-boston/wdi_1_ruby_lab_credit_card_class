require_relative '../lib/credit_card'

RSpec.describe CreditCard do
  # We use `let` for setting local variables
  let(:card_number) {"370619851809409"}
  let(:expiration) { "12/2015" }
  let(:ccv) {"252"}
  let(:name) {"Jeffery Stephenson"}
  let(:billing_zip) {"01010"}


  # Similarly, we use `subject` to create an instance
  # of the main object we are testing
  subject(:credit_card) { CreditCard.new(card_number, expiration, ccv, name, billing_zip) }


  describe '#initialize' do
    it 'creates a new instance of a CreditCard with a card number, expiration date, ccv, name and zip code' do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#not_expired?' do
    it 'returns true if the card is still valid' do
      expect(credit_card.not_expired?).to be true
    end
  end

  describe '#number_valid?' do
    it 'returns true if the card number valid' do
      expect(credit_card.credit_card_valid?).to be true
    end
  end

   describe '#has_name?' do
    it 'returns true if the name on the card is valid' do
      expect(credit_card.has_name?).to be true
    end
  end

   describe '#has_ccv?' do
    it 'returns true if the card has a valid ccv' do
      expect(credit_card.not_expired?).to be true
    end
  end

   describe '#zip_valid?' do
    it 'returns true if the card has a valid zip' do
      expect(credit_card.zip_valid?).to be true
    end
  end

   describe '#card_type?' do
    it 'returns brand of credit' do
      expect(credit_card.card_type).to eq("Amex")
    end
  end

  describe '#valid?' do
    it 'returns if card matches all things' do
      expect(credit_card.valid?).to be true
    end
  end


end

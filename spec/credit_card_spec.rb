require_relative '../lib/credit_card'

RSpec.describe CreditCard do
  # We use `let` for setting local variables
  let(:card_number) { 4012888888881881 }
  let(:expiration) { '2001-02-01' }
  # # Date.parse('2001-02-01')
  let(:ccv) { 831 }
  let(:name) { 'Bozo the Clown' }
  let(:zip_code) { '02157' }

  # Similarly, we use `subject` to create an instance
  # of the main object we are testing
  subject(:credit_card) { CreditCard.new(card_number, expiration, ccv, name, zip_code) }

  # Testing the initialize method
  # For this one, we mostly check that it creates a CreditCard
  describe '#initialize' do
    it 'creates a new instance of a CreditCard' do
      expect(credit_card).to be_a CreditCard
    end
  end

  # This is a test to see if the correct number of arguments get passed
  # The reason this works is because of the number of values passed
  # If I don't pass the correct number of values, I get an error
  describe '#is_valid?' do
    it 'Gives a boolean value if the card is valid' do
      expect(credit_card.is_valid?).to eq true
    end
  end

  # This is a test to determine the card type
  describe '#card_type' do
    it 'Gives a return of the card type based on the 1st number' do
      expect(credit_card.card_type).to eq 'Visa'
    end
  end

  # This is a test to see if the correct number of arguments get passed
  # My formula is wrong here but it was pretty late when I figured that out and then I was getting some seriously wrong stuff so I commented out the "new" code and left what I had written.
  # See the script for a more in-depth explanation
  describe '#luhn_algo_valid?' do
    it 'Gives a boolean value if the luhn algo is valid' do
      expect(credit_card.luhn_algo_valid?).to eq true
    end
  end


end


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

  # describe '#valid_card_number?' do
  #   it 'returns true if @card_number passes the Luhn algorithm' do
  #     expect(credit_card.valid_card_number?).to be true
  #   end
  # end

    describe '#convert_to_array' do
    it 'converts the cc number string into an array of digits' do
      expect(credit_card.convert_to_array).to eq [4,0,2,4,0,0,7,1,6,6,1,7,5,1,4,0]
    end
  end

  describe '#pop' do
    it 'removes the last item in the array and saves it' do
      expect(credit_card.cc_num_pop).to eq [4,0,2,4,0,0,7,1,6,6,1,7,5,1,4]
    end
  end

  describe '#cc_num_reverse' do
    it 'reverses the array and returns the reversed array' do
      expect(credit_card.cc_num_reverse).to eq [4,1,5,7,1,6,6,1,7,0,0,4,2,0,4]
    end
  end

  describe '#mutate_array' do
    it 'multiplies the odd positioned numbers (0+1 index), subtracts 9 if the product is greater than 9' do
      expect(credit_card.mutate_array).to eq [8,1,1,7,2,6,3,1,5,0,0,4,4,0,8]
    end
  end

  describe '#sum_array' do
    it 'sums the values of the entire array plus the checksum' do
      expect(credit_card.sum_array).to eq 50
    end
  end

  describe '#valid_card_number?' do
    it 'returns a boolean based on the sum' do
      expect(credit_card.valid_card_number?).to eq true
    end
  end

  describe '#card_type' do
    it 'returns the name of the card issuer (e.g. Visa)' do
      expect(credit_card.card_type).to be 'Visa'
    end
  end
end

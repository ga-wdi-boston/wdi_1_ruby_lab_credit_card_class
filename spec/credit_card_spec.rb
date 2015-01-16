require_relative '../lib/credit_card'

RSpec.describe CreditCard do
  let(:card_num) {"4556327117575180"}
  let(:expiration_date) {"0418"}
  let(:ccv) {"435"}
  let(:name) {"Billy Bob"}
  let(:zip_code) {"02474"}

  subject(:card) { CreditCard.new(card_num, expiration_date, ccv, name, zip_code) }

  describe '#initialize' do
    it 'creates a new instance of a CreditCard with a num' do
      expect(card).to be_a CreditCard
    end
  end

  #Valid credit card number
  describe '#valid?' do
    it 'Return if a credit card number is valid' do
      expect(card.valid?).to be true
    end
  end

  #Describe the card type
  describe '#name_card_type' do
    it 'Return the card type' do
      expect(card.name_card_type).to be :mastercard
    end
  end
end

RSpec.describe CreditCard do
  let(:card_num) {"7444333322221110"}
  let(:expiration_date) {"1112"}
  let(:ccv) {"57"}
  let(:name) {""}
  let(:zip_code) {"0382"}

  subject(:card) { CreditCard.new(card_num, expiration_date, ccv, name, zip_code) }

   #inValid credit card number #7444333322221110
  describe '#valid?' do
    it 'Return if a credit card number is valid' do
      expect(card.valid?).to be false
    end
  end

  #Describe the card type
  describe '#name_card_type' do
    it 'Return the card type' do
      expect(card.name_card_type).to be :other
    end
  end

end

RSpec.describe CreditCard do
  let(:card_num) {"6011328294371512"}
  let(:expiration_date) {"1118"}
  let(:ccv) {"570"}
  let(:name) {"Joe Peters"}
  let(:zip_code) {"03820"}

  subject(:card) { CreditCard.new(card_num, expiration_date, ccv, name, zip_code) }

   #Valid credit card number #6011328294371512
  describe '#valid?' do
    it 'Return if a credit card number is valid' do
      expect(card.valid?).to be true
    end
  end

  #Describe the card type
  describe '#name_card_type' do
    it 'Return the card type' do
      expect(card.name_card_type).to be :discover
    end
  end

end

RSpec.describe CreditCard do
  let(:card_num) {"3011328294371512"}
  let(:expiration_date) {"1218"}
  let(:ccv) {"890"}
  let(:name) {"P Rogers"}
  let(:zip_code) {"03820"}

  subject(:card) { CreditCard.new(card_num, expiration_date, ccv, name, zip_code) }

   #inValid credit card number #3011328294371512
  describe '#valid?' do
    it 'Return if a credit card number is valid' do
      expect(card.valid?).to be false
    end
  end

  #Describe the card type
  describe '#name_card_type' do
    it 'Return the card type' do
      expect(card.name_card_type).to be :american_express
    end
  end

end

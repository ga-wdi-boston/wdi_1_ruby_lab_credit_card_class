require_relative '../lib/credit_card'

RSpec.describe CreditCard do
  let(:cc_num){378282246310005}
  let(:exp_date){Date.new(2011,10)}
  let(:ccv){223}
  let(:name){"Bob"}
  let(:zip){11890}
  subject(:credit_card){CreditCard.new(cc_num, exp_date, ccv, name, zip)}

  describe '#initialize' do
    it 'creates a new instance of a CreditCard with a cc_num, exp_date, ccv, name, and zip' do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#card_type' do
    it 'Checks for the correct card_type' do
      expect(credit_card.card_type).to eq 'Amex'
    end
  end

  describe '#valid_num?' do
    it 'Checks for the correct card' do
      expect(credit_card.valid_num?).to be true
    end
  end

  describe '#valid?' do
    it 'checks if all the credit card stats are valid' do
      expect(credit_card.valid?(exp_date)).to be true
      expect(credit_card.valid?(ccv)).to be true
      expect(credit_card.valid?(name)).to be true
      expect(credit_card.valid?(zip)).to be true
    end
  end
end


require 'date'
require_relative '../lib/credit_card'

RSpec.describe CreditCard do
  let(:number){372760858875429}
  let(:exp_date){"10/2016"} #I tried almost a hundred different ways to see if this could just be a 2 digit month and a 2 digit year, but haven't found a way yet, so I am leaving it as is
  let(:ccv){987}
  let(:name){"John Smith"}
  let(:zip){11234}
  subject(:credit_card){CreditCard.new(number, exp_date, ccv, name, zip)}

  describe '#initialize' do
    it 'creates a new instance of a Credit Card with all credit card information' do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#valid cc number' do
    it 'checks that cc number has 13-16 digits' do
      expect(credit_card.valid_cc_number?).to be true
    end
  end

  describe '#valid zip' do
    it 'checks that the zip has 5 digits' do
      expect(credit_card.valid_zip?).to be true
    end
  end

  describe '#valid name' do
    it 'checks that the name is defined' do
      expect(credit_card.valid_name?).to be true
    end
  end

  describe '#valid_exp_date' do
    it 'checks that expiration date is valid' do
      expect(credit_card.valid_exp_date?).to be true
    end
  end

  describe '#card_type' do
    it 'checks that card is a valid card type' do
      expect(credit_card.card_type).to eq "AmEx"
    end
  end

  describe '#luhn_validity' do
    it 'checks if credit card is valid' do
      expect(credit_card.luhn_validity).to eq 9
    end
  end

end

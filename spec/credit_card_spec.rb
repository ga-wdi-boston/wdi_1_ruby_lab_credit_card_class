require_relative '../lib/credit_card'

  RSpec.describe CreditCard do
    let(:card_number) { "4929767075986897" }
    let(:exp_date) { Time.new(2015, 3) }
    let(:cvv) { 452 }
    let(:name) { "Broey Broerson"}
    let(:zip) { "12321" }

    subject(:credit_card) { CreditCard.new(card_number, exp_date, cvv, name, zip)}
    describe '#initialize' do
      it "it creates a new instance of creditcard" do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#valid_num?' do
    it 'determines whether or not the card number is valid' do
      expect(credit_card.valid_num?).to be true
    end
  end

  describe '#card_type?' do
    it 'determines the service provider of the card' do
      expect(credit_card.card_type?).to eq "Visa"
    end
  end

  describe '#valid_zip?' do
    it 'determines whether the zip code is valid or not' do
      expect(credit_card.valid_zip?).to be true
    end
  end

  describe '#valid_exp?' do
    it 'determines whether the expiration date is valid or not' do
      expect(credit_card.valid_exp?).to be true
    end
  end
end

    RSpec.describe CreditCard do
    let(:card_number) { "6101650579244728" }
    let(:exp_date) { Time.new(3, 15) }
    let(:ccv) { 452 }
    let(:name) { "Testy McAss"}
    let(:zip) {1232}

    subject(:credit_card) { CreditCard.new(card_number, exp_date, ccv, name, zip)}
  describe '#card_type?' do
    it 'determines the service provider of the card' do
      expect(credit_card.card_type?).to eq "Discover"
    end
  end
end

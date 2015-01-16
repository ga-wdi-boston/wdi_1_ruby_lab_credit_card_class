require_relative '../lib/credit_card'

RSpec.describe CreditCard do
  let(:number) { "5555555555554444" }
  let(:exp) { [2, 2016] }
  let(:ccv) {"123"}
  let(:name) {"Testy"}
  let(:zip) {"02124"}
  subject(:creditCard) { CreditCard.new(number, exp, ccv, name, zip) }


  describe '#initialize' do
    it 'creates a new instance of a credit card' do
      expect(creditCard).to be_a CreditCard
    end
  end

  describe '#hasName?' do
    it 'asks if the card has a Name' do
      expect(creditCard.hasName?).to eq true
    end
  end

  describe '#validZip?' do
    it 'asks if the card has a valid Zip' do
      expect(creditCard.validZip?).to eq true
    end
  end

  describe '#validNum?' do
    it 'asks if the card has a valid number' do
      expect(creditCard.validNum?).to eq true
    end
  end

  describe '#validDate?' do
    it 'asks if the card has a valid date' do
      expect(creditCard.validDate?).to eq true
    end
  end

  describe '#company' do
    it 'checks what company the card belongs to' do
      expect(creditCard.company).to eq "MasterCard"
    end
  end

  describe '#valid?' do
    it 'if the card is valid' do
      expect(creditCard.valid?).to eq true
    end
  end
end

RSpec.describe CreditCard do
  let(:number) { "75555554444" }
  let(:exp) { [12, 2008] }
  let(:ccv) {"123"}
  let(:name) {""}
  let(:zip) {"0214"}
  subject(:creditCard2) { CreditCard.new(number, exp, ccv, name, zip) }


  describe '#initialize' do
    it 'creates a new instance of a credit card' do
      expect(creditCard2).to be_a CreditCard
    end
  end

  describe '#hasName?' do
    it 'asks if the card has a Name' do
      expect(creditCard2.hasName?).to eq false
    end
  end

  describe '#validZip?' do
    it 'asks if the card has a valid Zip' do
      expect(creditCard2.validZip?).to eq false
    end
  end

  describe '#validNum?' do
    it 'asks if the card has a valid number' do
      expect(creditCard2.validNum?).to eq false
    end
  end

  describe '#validDate?' do
    it 'asks if the card has a valid date' do
      expect(creditCard2.validDate?).to eq false
    end
  end

  describe '#company' do
    it 'checks what company the card belongs to' do
      expect(creditCard2.company).to eq "I don't know."
    end
  end

  describe '#valid?' do
    it 'if the card is valid' do
      expect(creditCard2.valid?).to eq false
    end
  end
end

RSpec.describe CreditCard do
  let(:number) { "0000000000000001" }
  let(:exp) { [1, 2015] }
  let(:ccv) {"123"}
  let(:name) {"f f"}
  let(:zip) {"00000"}
  subject(:creditCard3) { CreditCard.new(number, exp, ccv, name, zip) }


  describe '#initialize' do
    it 'creates a new instance of a credit card' do
      expect(creditCard3).to be_a CreditCard
    end
  end

  describe '#hasName?' do
    it 'asks if the card has a Name' do
      expect(creditCard3.hasName?).to eq true
    end
  end

  describe '#validZip?' do
    it 'asks if the card has a valid Zip' do
      expect(creditCard3.validZip?).to eq true
    end
  end

  describe '#validNum?' do
    it 'asks if the card has a valid number' do
      expect(creditCard3.validNum?).to eq false
    end
  end

  describe '#validDate?' do
    it 'asks if the card has a valid date' do
      expect(creditCard3.validDate?).to eq true
    end
  end

  describe '#company' do
    it 'checks what company the card belongs to' do
      expect(creditCard3.company).to eq "I don't know."
    end
  end

  describe '#valid?' do
    it 'if the card is valid' do
      expect(creditCard3.valid?).to eq false
    end
  end
end


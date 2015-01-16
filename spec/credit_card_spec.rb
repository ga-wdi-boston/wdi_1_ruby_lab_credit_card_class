require_relative '../lib/credit_card'

RSpec.describe CreditCard do

  let(:name) {"john"}
  let(:number) {"12341283412341234"}
  let(:expiration) {"Date"} # look up Date class and parsing
  let(:ccv) {"987"}
  let(:zip) {"02158"}
  subject(:creditcard) {CreditCard.new(name, number, expiration, ccv, zip)}

  describe '#initialize' do
    it 'creates a new instance of CreditCard with a name and a number' do
      expect(creditcard).to be_a CreditCard
    end
  end

  describe '#name' do
    it 'returns the name of the CreditCard' do
      expect(creditcard.name).to be name
    end
  end

  describe '#number' do
    it 'returns the number of the CreditCard' do
      expect(creditcard.valid_number).to be true
    end
  end

  describe '#expiration' do
    it 'returns the expiration of the CreditCard' do
      expect(creditcard.expiration).to be expiration
    end
  end

  describe '#ccv' do
    it 'returns the ccv of the CreditCard' do
      expect(creditcard.ccv).to be ccv
    end
  end

  describe '#zip' do
    it 'returns the zip of the CreditCard' do
      expect(creditcard.zip).to be zip
    end
  end

end



# Credit card # (16-digits)
# - Expiration Date (two digit month, two digit year)
# - CCV (3 digit number on the back)
# - Name
# - Billing Zip Code (5-digits)

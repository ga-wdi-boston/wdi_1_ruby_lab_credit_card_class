require_relative '../lib/credit_card'


RSpec.describe CreditCard do
  let(:number) {4012888888881881}
  let(:exp_date) {"0416"} # zero is a problem?
  let(:ccv) {123}
  let(:name){"Carlos Montoya"}
  let(:zip){"01851"}      # Zip codes, for example, often look like numbers but they're not, they're strings.

  subject(:credit_card) {CreditCard.new(number, exp_date, ccv, name, zip)}

  describe '#initialize' do
    it 'creates a new instance of a Credit Card' do
      expect(credit_card).to be_a CreditCard
    end
  end
  describe '#HasName?' do
    it 'Checks if the credit card has a name' do
      expect(credit_card.has_name?).to be true
    end
  end
  describe '#Zip Code length?' do
    it 'Checks if the zipcode has the right length' do
      expect(credit_card.zip_length).to be 5
    end
  end

end











# valid? - This checks the validity of the credit card. Check that it has a name, proper length zip code, 16-digit number and an expiration date in the future.

require_relative '../lib/credit_card'
require 'spec_helper'

RSpec.describe CreditCard do

  let(:number) { 4532792914262853 }
  let(:exp_month) { 10 }
  let(:exp_year) { 17 }
  let(:ccv) { 123 }
  let(:name) { "John Smith" }
  let(:zip_code) { 12345 }
  subject(:credit_card) { CreditCard.new(number, exp_month, exp_year, ccv, name, zip_code) }

  describe '#initialize' do
    it 'Creates a new credit card' do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#is_valid' do
    it 'Returns if the credit card information is valid' do
      expect(credit_card.is_valid).to be true
    end
  end

  describe '#date_is_valid' do
    it 'Returns if the expiration date is valid' do
      expect(credit_card.date_is_valid).to be true
    end
  end

  describe '#luhn_validity' do
    it 'Returns if the card number is valid' do
      expect(credit_card.luhn_validity).to be true
    end
  end

  describe '#card_type' do
    it 'Returns the card card type.' do
      expect(credit_card.card_type).to eq "Visa"
    end
  end

end

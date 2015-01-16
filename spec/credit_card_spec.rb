require 'spec_helper'

require_relative '../lib/credit_card'


RSpec.describe CreditCard do
  let(:number) { 5555555555554444 }
  let(:exp_month) {"10"}
  let(:exp_year) {"2017"}
  let(:cvv) { 789 }
  let(:name) { "Max Blaushild" }
  let(:zip) { 12141 }
  subject(:credit_card) { CreditCard.new(number, exp_month, exp_year, cvv, name, zip)}
  describe '#initialize' do
    it 'creates a new instance of a CreditCard' do
      expect(credit_card).to be_a CreditCard
    end
  end

  describe '#valid?' do
    it 'makes sure a credit card is valid' do
      expect(credit_card.valid?).to be true
    end
  end

  describe '#card_type' do
    it 'returns to type of the credit card' do
      expect(credit_card.card_type). to eq "mastercard"
    end
  end
end

require 'spec_helper'
require_relative '../lib/credit_card'


describe CreditCard do
  describe '#initialize' do
    it 'has an initialize method' do
      expect (CreditCard.new).to eq CreditCard.initialize
    end
  end

  describe '#valid?' do
    it 'checks that the card has a name' do
      new_card = CreditCard.new("Laure Fischer")
      expect (new_card.valid?).to eq true
    end
  end
end

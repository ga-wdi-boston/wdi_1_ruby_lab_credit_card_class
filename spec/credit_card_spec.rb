require 'spec_helper'
require_relative '../lib/credit_card'
require 'pry'

describe CreditCard do
  describe '#initialize' do
    it 'creates a CreditCard instance when called' do
      new_cc = CreditCard.new(
        4222574612345678,
        "0515",
        643,
        "Prescott",
        "02150")
      expect(new_cc.class).to eq CreditCard
    end
  end

  describe '#valid' do
    it 'returns false if number not 16-digit' do
      new_cc = CreditCard.new(
        1,
        "0515",
        643,
        "Prescott",
        "02150")
      expect(new_cc.valid?).to eq false
    end
    it 'returns false if exp date not in future' do
      new_cc = CreditCard.new(
        1,
        "0512",
        643,
        "Prescott",
        "02150")
      expect(new_cc.valid?).to eq false
    end
    it 'returns false if name empty' do
      new_cc = CreditCard.new(
        1,
        "0515",
        643,
        "",
        02150)
      expect(new_cc.valid?).to eq false
    end
     it 'returns false if zipcode improper length' do
      new_cc = CreditCard.new(
        1,
        "0515",
        643,
        "",
        "021504")
      expect(new_cc.valid?).to eq false
    end
    it 'returns valid if attributes appropriate' do
      new_cc = CreditCard.new(
        4322444444444444,
        "0515",
        643,
        "Prescott",
        "02150")
      expect(new_cc).to be_valid
    end
  end

  describe '#card_type' do
    it 'returns Visa if number starts with 4' do
      new_cc = CreditCard.new(
        4322444444444444,
        "1115",
        643,
        "Prescott",
        "02150")
      expect(new_cc.card_type).to eq "Visa"
    end
  end
end

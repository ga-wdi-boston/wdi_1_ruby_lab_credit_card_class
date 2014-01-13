require 'spec_helper'

require_relative '../lib/credit_card'

describe CreditCard do
  describe '#valid?' do
    it 'returns true if there is a CreditCard object' do
      my_cc = CreditCard.new('375024253860990', '11/16', '123', 'Jordan Morano', '02139')
      expect(my_cc.valid?).to eq true
    end

    it 'returns false => number != 15 / not digits' do
      my_cc = CreditCard.new('3750abcd', '11/16', '123', 'Jordan Morano', '02139')
      expect(my_cc.valid?). to eq false
    end

    it 'returns false => date is in the wrong format / illogical' do
      my_cc = CreditCard.new('375024253860990', '20/nov', '123', 'Jordan Morano', '02139')
      expect(my_cc.valid?). to eq false
    end

    it 'returns false => ccv is < 3 / not a number' do
      my_cc = CreditCard.new('375024253860990', '11/19', 'ab123', 'Jordan Morano', '02139')
      expect(my_cc.valid?). to eq false
    end

    it 'returns false => name is not valid first and last' do
      my_cc = CreditCard.new('375024253860990', '11/19', '123', 'Jordan', '02139')
      expect(my_cc.valid?). to eq false
    end

    it 'returns false => billing zip is not 5 digits' do
      my_cc = CreditCard.new('375024253860990', '11/19', '123', 'Jordan Morano', '0213')
      expect(my_cc.valid?). to eq false
    end
  end

end

require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard.new do
  describe '#valid?' do
    it 'checks for validity of card information' do
      visa_card = CreditCard.new(4929510744543594, '04/2023', 337, 'michael scott', 01450)
      expect (CreditCard.valid?).to eq true
describe '#card_type' do
  it 'returns type of card based on number'
  expect
    end
  end
end

# describe Geometry::Circle do
#   describe '#circumference' do
#     it 'two times the radius times Pi' do
#       circle = Geometry::Circle.new(6)
#       expect(circle.circumference).to eq 37.68
#     end
#   end

#   describe '#area' do
#     it 'squares the radius and multiplies it by Pi' do
#       circle = Geometry::Circle.new(6)
#       expect(circle.area).to eq 113.04
#     end

  end
end
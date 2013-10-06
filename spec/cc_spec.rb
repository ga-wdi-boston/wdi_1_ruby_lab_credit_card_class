require 'spec_helper'
require_relative '../lib/cc'

describe 'Valid Master Card' do
  subject { CreditCard.new('5531303004719733', '2015-05-03', 123, 'Carl Perkins', '02138') }

  it 'should be a valid credit card number via luhn' do
    subject.valid_luhn?.should be true
  end

  it 'should be a valid card' do
    subject.valid?.should be true
  end

  it 'should have a card type of MasterCard' do
    subject.card_type.should eq 'MasterCard'
  end
end

describe 'Valid Discover Card' do
  subject { CreditCard.new('6011138502696836', '2015-05-03', 123, 'Carl Perkins', '02138') }

  it 'should be a valid credit card number via luhn' do
    subject.valid_luhn?.should be true
  end

  it 'should be a valid card' do
    subject.valid?.should be true
  end

  it 'should have a card type of Discover' do
    subject.card_type.should eq 'Discover'
  end
end

describe 'Invalid Card' do
  subject { CreditCard.new('4572832347923', '2015-05-03', 123, 'Carl Perkins', '02138') }

  it 'should be a valid credit card number' do
    subject.valid_luhn?.should be false
  end
end
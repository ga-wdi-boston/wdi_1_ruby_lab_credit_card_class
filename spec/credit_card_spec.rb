require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard do
  describe'#initialize' do
    it 'creates a new credit card' do
      my_card = CreditCard.new
    expect my_card.initialize.should eq CreditCard.new
    end
  end

    describe '#valid?' do
      it 'checks the validity of the credit card' do
        my_card = Creditcard.new
        expect my_card.valid?.should == true
      end
    end
  end

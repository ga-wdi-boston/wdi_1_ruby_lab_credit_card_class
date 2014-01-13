require 'spec_helper'
require_relative '../lib/credit_card'

describe CreditCard do

	before(:each) do
		@test_card = CreditCard.new(3333444455556666, 1212, 333, 'Em Sesier', 01773)
	end

	describe '#initialize' do
		it 'requires parameter number and assigns to attribute' do
			expect (@test_card.number).to eq 3333444455556666
		end

		it 'requires parameter exp_date and assigns to attribute' do
			expect (@test_card.exp_date).to eq 1212
		end

		it 'requires parameter ccv and assigns to attribute' do
			expect (@test_card.ccv).to eq 333
		end

		it 'requires parameter name and assigns to attribute' do
			expect (@test_card.name).to eq 'Em Sesier'
		end

	end

	describe '#valid?' do
		it 'returns true if cc number is equal to 16' do
			expect(@test_card.number.to_s.length == 16).to eq true
		end

	end


end
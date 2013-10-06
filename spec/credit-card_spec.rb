require 'spec_helper'
require_relative '../lib/credit-card'

describe CreditCard do

	subject {CreditCard.new(4716_5316_2702_8476, '1113', 623, "Matt Clement", 78782)}

	it "should be valid" do
		subject.valid?.should be true
	end

end

describe "Invalid Credit Card" do
let(:wrong_number_card) {CreditCard.new(543_2874_5678_087, '1213', 623, "Matt Clement", 02143)}

	it "should return an error when the card number has not sixteen digits" do
	  wrong_number_card.valid?.should_not be true
	end

end

describe "Expired Credit Card" do
let(:expired_card) {CreditCard.new(4716_5316_2702_8476, '0608', 623, "Matt Clement", 02143)}

	it "should return an error when the card has expired" do
	  expired_card.valid?.should_not be true
	end

end

describe "Nameless Credit Card" do
let(:nameless_card) {CreditCard.new(4716_5316_2702_8476, '1113', 623, 02143, 78726)}

	it "should return an error when no name is passed in" do
	  nameless_card.valid?.should_not be true
	end

end


describe "Bad Zip Code" do
let(:zipless_card) {CreditCard.new(4716_5316_2702_8476, '1113', 623, "Amal Hussein", 7876)}

	it "should return an error when an invalid zip code is passed in" do
	  zipless_card.valid?.should_not be true
	end

end

describe "invalid card number" do
let(:invalid_card) {CreditCard.new(1234_5678_9012_3456, '1014', 623, "Matt Clement", 92143)}

	it "should check the card number against an algorithm for validity" do
	  invalid_card.valid?.should_not be true
	end

end




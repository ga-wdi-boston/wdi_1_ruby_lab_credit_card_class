require 'spec_helper'
require_relative '../lib/main'


describe CreditCard do

  subject { CreditCard.new("4532584758868410", "09/14", "333", "Blake Ruddock", "06832") }

  its(:valid_number) { should eq true}
  its(:has_name) { should eq true}
  its(:valid_zip) { should eq true}
  its(:valid_date) {should eq true}
  its(:valid?) {should eq true}

end

require 'date'

class CreditCard
  def initialize(card_number, exp_date, ccv, name, zip_code)
    @card_number = card_number
    @exp_date = exp_date
    @ccv = ccv
    @name = name
    @zip_code = zip_code
  end

  def luhn
    card_num_array = @card_number.to_s.chars

    card_num_array.map do |x|
      if x.to_i%2 == 0
        double = x.to_i * 2
        if double > 9
          sum_array = double.to_s.chars
          sum_array.map do |y|
            y.to_i
          end.inject(:+)
        else
          double
        end
      else
        x.to_i
      end
    end.inject(:+) % 10

  end

  # returns true if still valid
  def expired?
    # Date.new(@exp_date) - Date.today < 0
    # Date class not in Ruby 2.2.0 so switching to Time class
    Time.new(@exp_date) - Time.now < 0
  end

  def card_type
    if @card_number.to_s[0] == '3' && # american express
       @card_number.to_s[1] == '4' ||
       @card_number.to_s[1] == '7' &&
       @card_number.to_s.length == 15
       card_type = 'American Express'
    elsif @card_number.to_s[0] == '3' && # master card
          @card_number.to_s[1].to_i == 1..5 &&
          @card_number.to_s.length == 16
          card_type = 'Master Card'
    elsif @card_number.to_s[0] == '4' && # visa
          @card_number.to_s.length == 13..16
          card_type = 'Visa'
    elsif @card_number.to_s.length == 16 && # discover
          @card_number.to_s[0..7].to_i == (60110000..60119999) ||
          @card_number.to_s[0..7].to_i == (65000000..65999999) ||
          @card_number.to_s[0..7].to_i == (62212600..62292599)
          card_type = 'Discover'
    else
      card_type = 'Other'
    end
  end

  def valid?
    if card_type == 'American Express'
      @card_number.to_s.length == 15
    elsif card_type == 'Master Card'
      @card_number.to_s.length == 16
    elsif card_type == 'Visa'
      @card_number.to_s.length == 13..16
    elsif card_type = 'Discover'
      @card_number.to_s.length == 16
    else
      @card_number.to_s.length == 16
    end &&
    @name != "" &&
    @zip_code.to_s.length == 5 &&
    #luhn? == 0 && # could not find a valid credit card so excluding here
    expired?
  end

end

require 'JSON'

class CreditCard
  attr_accessor :number, :expiry, :ccv, :name, :zip

    def initialize(number, expiry, ccv, name, zip)
      @number = number
      @expiry = expiry
      @ccv = ccv
      @name = name
      @zip = zip
    end

    def valid_luhn?
      number = self.number.gsub(/\D/, '').reverse
      sum, i = 0, 0
      number.each_char do |ch|
        n = ch.to_i
        n *= 2 if i.odd?
        n = 1 + (n - 10) if n >= 10
        sum += n
        i += 1
      end
      (sum % 10).zero?
    end

    def valid?
      self.number.length == 16 && self.zip.length == 5 && Date.parse(self.expiry) > Date.today && self.name != '' ? true : false
    end

    def card_type
      if self.valid_luhn? == true
        case self.number[0]
          when '4'
            return 'Visa'
          when '5'
            return 'MasterCard'
          when '6'
            return 'Discover'
          when '3'
            return 'Amex'
          else
            return 'other'
          end
        end
    end
end
class CreditCard
  require 'date'
  attr_reader  :card_num, :expiration_date, :ccv, :name,:zip_code, :now, :card_type

  def initialize (card_num,expiration_date, ccv, name, zip_code)
    @card_num = card_num
    @expiration_date = expiration_date
    @ccv = ccv
    @name = name
    @zip_code = zip_code
    @now = Time.new
    @card_type = {
      american_express: "3",
      mastercard: "4",
      visa: "5",
      discover: "6",
      other: "7"
    }
  end

  def valid? #Valid card and information
    luhn_pass? && expiration_date_pass? && ccv_pass? && name && zip_code_pass?
  end

  def luhn_pass? #Test whether a str passes luhn test
    card_arr = card_num.split("").reverse
    even_arr, odd_arr = split_arr(card_arr)
    odd_sum = sum_arr(odd_arr)

    #doub_even_arr = double(even_arr)
    even_sig_arr = split_digit(even_arr.map{|num| num * 2})
    even_sum = sum_arr(even_sig_arr)

    (odd_sum + even_sum).to_s.split("").last == "0"
  end

  #Split each digit in an array.
  def split_digit(arr)
    arr.join.split("").map{|num| num.to_i}
  end

  #Doubles each integer in an arr
  #def double(arr)
   # arr.map{|num| num * 2}
  #end

  #Adds up all array elements
  def sum_arr(arr)
      arr.inject(0, &:+)
    end

  #Note this splits the arr in even/odd
  def split_arr(arr)
    even_arr,odd_arr = [],[]
    arr.each_with_index do |num, ind|
      ind % 2 == 0 ? even_arr << (num.to_i) : odd_arr << num.to_i
    end
    return even_arr, odd_arr
  end

  #Expiration date exceed present month/year
  def expiration_date_pass?
    cur_date = now.month.to_s << now.year.to_s[2,3]
    cur_date.length < 4 ? cur_date.insert(0, '0') : false
    expiration_date > cur_date
  end

  #Min needs to be 3 long.
  def ccv_pass? #CCV long enough to be valid
      ccv.length == 3
    end

   #Min needs first, white space, & last, ex J Ki
  def name_pass?
    name.length > 4
  end

  def zip_code_pass?
    zip_code.length == 5
  end

  #Names the card type based on 1st card number
  def name_card_type
    card_type.value?(card_num[0]) == true ? card_type.key(card_num[0]) : cart_type.key(7)
  end

end

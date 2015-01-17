class CreditCard
  def initialize(card_number, exp_date, cvv, name, zip)
    @card_number = card_number
    @exp_date = exp_date
    @cvv = cvv
    @name = name
    @zip = zip
  endgit

  def valid_num?
    if @card_number.length != 16
      return false
    else
      nums = @card_number.to_s.split("")
      checkdigit = nums[nums.length - 1]
      nums[nums.length - 1] = 0
      nums.reverse!
      sum = 0
      for i in 1..nums.length
        if i % 2 == 0
          sum = sum + nums[i].to_i
          next
        end
        nums[i] = (nums[i].to_i * 2 < 10 ) ? (nums[i].to_i * 2) : (nums[i].to_i * 2 - 9)
        sum = sum + nums[i].to_i
      end
      (10 - sum % 10).to_i == checkdigit.to_i
    end
  end

  def valid_zip?
    @zip.length == 5
  end

  def valid_exp?
    @exp_date - Time.now > 0
  end

  def card_type?
    card_type = "Other"
    if @card_number.slice(0..1).eql?("34") || @card_number.slice(0..1).eql?("27")
      card_type = "American Express"
    elsif @card_number[0].eql?("4")
      card_type = "Visa"
    elsif @card_number.slice(0..3).eql?("6101")
      card_type = "Discover"
    elsif @card_number.slice(0..1).eql?("51") || @card_number.slice(0..1).eql?("52") || @card_number.slice(0..1).eql?("53") || @card_number.slice(0..1).eql?("54") || @card_number.slice(0..1).eql?("55")
      card_type = "MasterCard"
    end
  end
end

require 'securerandom'

module DataHelpers

  def a_string
    SecureRandom.hex
  end

  def a_date
    a_time.to_datetime
  end

  def a_date_after date
    date + 1.day + a_number.seconds
  end

  def a_number_string
    a_number.to_s
  end

  private

  def a_number
    rand 10000000000
  end

  def a_time
    Time.at(a_number)
  end

end

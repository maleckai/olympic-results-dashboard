require 'securerandom'

module DataHelpers

  def some_sports
    a_number(min: 1, max: 5).times.map { a_sport }
  end

  def a_sport
    Sport.create(name: a_string)
  end

  def some_past_events_for sport
    events = a_number(min: 1, max: 5).times.map do
      start_time = a_date_before now
      an_event_for sport, start_time
    end
    events.sort_by { |event| event.start_at }
  end

  def some_upcoming_events_for sport
    events = a_number(min: 1, max: 5).times.map do
      start_time = a_date_after now
      an_event_for sport, start_time
    end
    events.sort_by { |event| event.start_at }
  end

  def some_events_for sport
    events = a_number(min: 1, max: 5).times.map { an_event_for sport }
    events.sort_by { |event| event.start_at }
  end

  def an_event_for sport, start_time=a_date, finish_time=nil, country_one=a_country, country_two=a_country
    finish_time ||= start_time + a_random_number_of_hours
    Event.create({
      start_at: start_time,
      finish_at: finish_time,
      sport_id: sport.id,
      event_teams_attributes: [
        { country: country_one, score: a_number },
        { country: country_two, score: a_number }
      ]
    })
  end

  def a_country
    Country.create(name: a_string)
  end

  def a_string
    SecureRandom.hex
  end

  def a_date
    a_time.to_datetime
  end

  def a_date_after date
    date + 1.day + a_unix_timestamp.seconds
  end

  def a_date_before date
    date - 1.day - a_unix_timestamp.seconds
  end

  def a_number_string
    a_number.to_s
  end

  private

  def a_unix_timestamp
    a_number(max: 10000000000)
  end

  def a_number params={}
    min = params[:min] || 0
    max = params[:max] || 10000
    rand min..max
  end

  def a_random_number_of_hours
    (1..4).to_a.sample.hours
  end

  def a_time
    Time.at(a_unix_timestamp)
  end

  def now
    DateTime.now
  end

end

namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do
    DummyData.populate_database
  end
end

# TODO.BD - Come back and refactor this later if I have time.
#           This was mostly for fun, but ideally I'd break this out into several
#           single purpose classes rather than sticking it all in one.
class DummyData

  class << self

    def populate_database
      print "Populating countries... "
      populate_countries
      print "Done!\nPopulating sports...... "
      populate_sports
      print "Done!\nGenerating events...... "
      generate_events unless Event.any?
      puts "Done!"
    end

    private

    def generate_events
      Event.transaction do
        generate_future_events
        generate_current_events
        generate_past_events
      end
    end

    def generate_future_events
      random_number.times do
        generate_future_event
      end
    end

    def generate_future_event
      start_time = a_date_in_the_future
      finish_time = start_time + random_number_of_hours
      generate_event start_time, finish_time
    end

    def generate_current_events
      random_number.times do
        generate_current_event
      end
    end

    def generate_current_event
      start_time = now - random_number_of_hours
      finish_time = now + random_number_of_hours
      generate_event start_time, finish_time
    end

    def generate_past_events
      random_number.times do
        generate_past_event
      end
    end

    def generate_past_event
      start_time = a_date_in_the_past
      finish_time = start_time + random_number_of_hours
      generate_event start_time, finish_time
    end

    def generate_event start_time, finish_time
      event_data = build_event_data start_time, finish_time
      Event.create event_data
    end

    def build_event_data start_time, finish_time
      sport = a_random_sport
      countries = two_random_countries
      {
        start_at: start_time,
        finish_at: finish_time,
        sport: sport,
        event_teams_attributes: build_event_teams_attributes(countries)
      }
    end

    def build_event_teams_attributes countries
      countries.map do |country|
        { score: random_number, country: country }
      end
    end

    def populate_countries
      Country.transaction do
        populate_with countries_fixture do |country_name|
          Country.where(name: country_name).first_or_create
        end
      end
    end

    def populate_sports
      Sport.transaction do
        populate_with sports_fixture do |sport_name|
          Sport.where(name: sport_name).first_or_create
        end
      end
    end

    def populate_with fixture
      File.open(fixture, "r") do |file|
        file.each_line do |line|
          yield line.strip
        end
      end
    end

    def countries_fixture
      fixture_location.join 'countries.txt'
    end

    def sports_fixture
      fixture_location.join 'sports.txt'
    end

    def fixture_location
      Rails.root.join 'lib/fixtures/'
    end

    def random_number
      (5..20).to_a.sample
    end

    def a_random_sport
      Sport.all.sample
    end

    def two_random_countries
      Country.all.sample 2
    end

    def now
      DateTime.now
    end

    def a_date_in_the_future
      a_date_after now
    end

    def a_date_after date
      date + 1.day + random_number_of_seconds
    end

    def a_date_in_the_past
      a_date_before now
    end

    def a_date_before date
      date - 1.day - random_number_of_seconds
    end

    def random_number_of_hours
      (1..4).to_a.sample.hours
    end

    def random_number_of_seconds
      rand(100000000).seconds
    end

  end

end

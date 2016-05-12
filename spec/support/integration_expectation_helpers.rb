module IntegrationExpectationHelpers

  def expected_sport_hashes sports
    sports.map do |sport|
      expected_sport_hash sport
    end
  end

  def expected_sport_hash sport
    {
      name: sport.name,
      links: {
        up: '/sports',
        self: "/sports/#{sport.id}",
        events: "/sports/#{sport.id}/events"
      }
    }
  end

  def expected_event_hashes events
    events.map do |event|
      expected_event_hash event
    end
  end

  def expected_event_hash event
    {
      start_at: event.start_at,
      finish_at: event.finish_at,
      sport: expected_sport_hash(event.sport),
      event_teams: expected_event_team_hashes(event.event_teams)
    }
  end

  def expected_event_team_hashes event_teams
    event_teams.map do |event_team|
      expected_event_team_hash event_team
    end
  end

  def expected_event_team_hash event_team
    {
      score: event_team.score,
      country: expected_country_hash(event_team.country)
    }
  end

  def expected_country_hash country
    {
      name: country.name
    }
  end

end

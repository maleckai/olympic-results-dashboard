require 'rails_helper'

RSpec.describe 'GET /sports/:sport_id/events' do

  let(:expected_response_json) {
    expected_response.to_json
  }

  context 'with no events' do

    let(:sport_id) { created_sport.id }
    let(:created_sport) { a_sport }

    let(:expected_response) {
      {
        sport_events: [],
        links: {
          up: "/sports/#{sport_id}",
          self: "/sports/#{sport_id}/events"
        }
      }
    }

    it 'returns the expected response' do
      get "/sports/#{sport_id}/events"

      expect(response.body).to eq expected_response_json
    end

  end

  context 'with existing events' do

    let(:sport_id) { created_sport.id }
    let(:created_sport) { a_sport }
    let(:expected_events) { expected_event_hashes(@created_events) }

    let(:expected_response) {
      {
        sport_events: expected_events,
        links: {
          up: "/sports/#{sport_id}",
          self: "/sports/#{sport_id}/events"
        }
      }
    }

    before do
      @created_events = some_events_for created_sport
    end

    it 'returns the expectedd response' do
      get "/sports/#{sport_id}/events"

      expect(response.body).to eq expected_response_json
    end

  end

end

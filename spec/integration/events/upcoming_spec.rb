require 'rails_helper'

RSpec.describe 'GET /events/upcoming' do

  let(:expected_response_json) {
    expected_response.to_json
  }

  context 'with no upcoming events' do

    let(:created_sport) { a_sport }

    let(:expected_response) {
      {
        upcoming_events: [],
        links: {
          up: '/events',
          self: '/events/upcoming'
        }
      }
    }

    before do
      @created_events = some_past_events_for created_sport
    end

    it 'returns the expected response' do
      get '/events/upcoming'

      expect(response.body).to eq expected_response_json
    end

  end

  context 'with upcoming events' do

    let(:created_sport) { a_sport }
    let(:expected_events) { expected_event_hashes(@created_events) }

    let(:expected_response) {
      {
        upcoming_events: expected_events,
        links: {
          up: '/events',
          self: '/events/upcoming'
        }
      }
    }

    before do
      @created_events = some_upcoming_events_for created_sport
    end

    it 'returns the expectedd response' do
      get '/events/upcoming'

      expect(response.body).to eq expected_response_json
    end

  end

end

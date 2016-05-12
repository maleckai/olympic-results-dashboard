require 'rails_helper'

RSpec.describe 'GET /sports' do

  let(:expected_response_json) {
    expected_response.to_json
  }

  context 'with no existing data' do

    let(:expected_response) {
      {
        sports: [],
        links: {
          up: '/',
          self: '/sports'
        }
      }
    }

    it 'returns the expected response' do
      get '/sports'

      expect(response.body).to eq expected_response_json
    end

  end

  context 'with existing data' do

    let(:expected_sports) { expected_sport_hashes(@created_sports) }
    let(:expected_response) do
      {
        sports: expected_sports,
        links: {
          up: '/',
          self: '/sports'
        }
      }
    end

    before do
      @created_sports = some_sports
    end

    it 'returns the expectedd response' do
      get '/sports'

      expect(response.body).to eq expected_response_json
    end

  end

end

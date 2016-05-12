require 'rails_helper'

RSpec.describe 'GET /sports/:id' do

  context 'with no matching sport' do

    let(:sport_id) { a_number min: 1, max: 100 }
    let(:expected_response_code) { 404 }

    it 'returns a 404 response' do
      get "/sports/#{sport_id}"

      expect(response.status).to eq expected_response_code
    end

  end

  context 'with a matching sport' do

    let(:sport_id) { created_sport.id }

    let(:created_sport) { a_sport }
    let(:expected_response) { expected_sport_hash created_sport }
    let(:expected_response_json) { expected_response.to_json }

    it 'returns the expectedd response' do
      get "/sports/#{sport_id}"

      expect(response.body).to eq expected_response_json
    end

  end

end

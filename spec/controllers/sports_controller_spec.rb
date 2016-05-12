require 'rails_helper'

RSpec.describe SportsController, type: :controller do

  describe '#index' do

    let(:all_sports) { double 'all_sports' }
    let(:expected_render_data) {
      {
        json: all_sports,
        meta_key: :links,
        links: {
          up: String,
          self: String
        }
      }
    }

    before do
      allow(Sport).to receive(:all).and_return all_sports
      allow(subject).to receive(:render)
    end

    it 'retrieves all sports from the database' do
      get :index
      expect(Sport).to have_received(:all)
    end

    # I would prefer to test this in a different way, but
    # ActiveModel::Serializer uses a bit too much magic to properly mock it out
    # given the time available.
    # The response will be tested with an integration test.
    it 'renders a response with the expected data' do
      get :index
      expect(subject).to have_received(:render).with(expected_render_data)
    end

  end

  describe '#show' do

    let(:sport_id) { a_number_string }
    let(:found_sport) { double 'found_sport' }
    let(:expected_render_data) {
      {
        json: found_sport,
        root: false
      }
    }

    before do
      allow(Sport).to receive(:find).and_return found_sport
      allow(subject).to receive(:render)
    end

    it 'retrieves all sports from the database' do
      get :show, params: { id: sport_id }
      expect(Sport).to have_received(:find).with(sport_id)
    end

    # I would prefer to test this in a different way, but
    # ActiveModel::Serializer uses a bit too much magic to properly mock it out.
    # The response will be tested with an integration test.
    it 'renders a response with the expected data' do
      get :show, params: { id: sport_id }
      expect(subject).to have_received(:render).with(expected_render_data)
    end

  end

end

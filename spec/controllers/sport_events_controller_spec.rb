require 'rails_helper'

RSpec.describe SportEventsController, type: :controller do

  describe '#index' do

    let(:sport_id) { a_number_string }
    let(:all_sport_events) { double 'all_sport_events' }
    let(:expected_render_data) {
      {
        json: all_sport_events,
        meta_key: :links,
        links: {
          up: String,
          self: String
        }
      }
    }

    before do
      allow(Event).to receive(:for_sport).and_return all_sport_events
      allow(subject).to receive(:render)
    end

    it 'retrieves all sports from the database' do
      get :index, params: { sport_id: sport_id }
      expect(Event).to have_received(:for_sport).with(sport_id)
    end

    # I would prefer to test this in a different way, but
    # ActiveModel::Serializer uses a bit too much magic to properly mock it out
    # given the time available.
    # The response will be tested with an integration test.
    it 'renders a response with the expected data' do
      get :index, params: { sport_id: sport_id }
      expect(subject).to have_received(:render).with(expected_render_data)
    end

  end

end

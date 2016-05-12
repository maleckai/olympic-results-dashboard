require 'rails_helper'

RSpec.describe Events::UpcomingEventsController, type: :controller do

  describe '#index' do

    let(:upcoming_events) { double 'upcoming_events' }
    let(:expected_render_data) {
      {
        json: upcoming_events,
        meta_key: :links,
        links: {
          up: String,
          self: String
        }
      }
    }

    before do
      allow(Event).to receive(:upcoming).and_return upcoming_events
      allow(subject).to receive(:render)
    end

    it 'retrieves all upcoming events from the database' do
      get :index
      expect(Event).to have_received(:upcoming)
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

end

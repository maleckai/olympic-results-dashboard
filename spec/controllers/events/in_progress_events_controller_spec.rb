require 'rails_helper'

RSpec.describe Events::InProgressEventsController, type: :controller do

  describe '#index' do

    let(:in_progress_events) { double 'in_progress_events' }
    let(:expected_render_data) {
      {
        json: in_progress_events,
        meta_key: :links,
        links: {
          up: String,
          self: String
        }
      }
    }

    before do
      allow(Event).to receive(:in_progress).and_return in_progress_events
      allow(subject).to receive(:render)
    end

    it 'retrieves all upcoming events from the database' do
      get :index
      expect(Event).to have_received(:in_progress)
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

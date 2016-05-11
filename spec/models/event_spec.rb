require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:start_time) { a_date }
  let(:finish_time) { a_date_after start_time }
  let(:valid_event_data) { { start_at: start_time, finish_at: finish_time } }

  let(:event_data) { valid_event_data }

  subject { Event.new event_data }

  describe '#valid?' do

    context 'with valid data' do

      it 'returns true' do
        expect(subject.valid?).to be true
      end

    end

    context 'without a value for start_at' do

      let(:event_data) { valid_event_data.except :start_at }

      it 'returns false' do
        expect(subject.valid?).to be false
      end

    end

    context 'without a value for finish_at' do

      let(:event_data) { valid_event_data.except :finish_at }

      it 'returns false' do
        expect(subject.valid?).to be false
      end

    end

  end

  describe '#start_at' do

    it 'returns the provided start time' do
      expect(subject.start_at).to eq start_time
    end

  end

  describe '#finish_at' do

    it 'returns the provided finish time' do
      expect(subject.finish_at).to eq finish_time
    end

  end

end

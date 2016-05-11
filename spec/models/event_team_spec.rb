require 'rails_helper'

RSpec.describe EventTeam, type: :model do

  let(:score) { a_number }
  let(:event_team_data) { { score: score } }

  subject { EventTeam.new event_team_data }

  describe '#valid?' do

    context 'with valid data' do

      it 'returns true' do
        expect(subject.valid?).to be true
      end

    end

    context 'with no score' do

      let(:event_team_data) { {} }

      it 'returns true' do
        expect(subject.valid?).to be true
      end

    end

    context 'with a non-numeric score' do

      let(:event_team_data) { { score: a_string } }

      it 'returns false' do
        expect(subject.valid?).to be false
      end

    end

  end

  describe '#score' do

    it 'returns the provided score' do
      expect(subject.score).to eq score
    end

  end

end

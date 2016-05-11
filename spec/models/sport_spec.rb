require 'rails_helper'
require 'securerandom'

RSpec.describe Sport, type: :model do

  def a_string
    SecureRandom.hex
  end

  let(:sport_name) { a_string }
  let(:sport_data) { { name: sport_name } }

  subject { Sport.new sport_data }

  describe '#valid?' do

    context 'with valid data' do

      it 'returns true' do
        expect(subject.valid?).to be true
      end

    end

    context 'with invalid data' do

      let(:sport_data) { {} }

      it 'returns false' do
        expect(subject.valid?).to be false
      end

    end

  end

  describe '#name' do

    it 'returns the provided name' do
      expect(subject.name).to eq sport_name
    end

  end

end

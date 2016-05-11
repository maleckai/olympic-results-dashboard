require 'rails_helper'
require 'securerandom'

RSpec.describe Country, type: :model do

  def a_string
    SecureRandom.hex
  end

  let(:country_name) { a_string }
  let(:country_data) { { name: country_name } }

  subject { Country.new country_data }

  describe '#valid?' do

    context 'with valid data' do

      it 'returns true' do
        expect(subject.valid?).to be true
      end

    end

    context 'with invalid data' do

      let(:country_data) { {} }

      it 'returns false' do
        expect(subject.valid?).to be false
      end

    end

  end

  describe '#name' do

    it 'returns the provided name' do
      expect(subject.name).to eq country_name
    end

  end

end

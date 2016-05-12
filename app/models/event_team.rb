class EventTeam < ApplicationRecord
  belongs_to :event
  belongs_to :country

  validates :score, numericality: { only_integer: true }

end

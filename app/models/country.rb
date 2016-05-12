class Country < ApplicationRecord
  has_many :event_teams

  validates :name, presence: true

end

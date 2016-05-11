class Country < ActiveRecord::Base
  has_many :event_teams

  validates :name, presence: true

end

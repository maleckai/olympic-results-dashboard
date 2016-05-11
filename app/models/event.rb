class Event < ActiveRecord::Base
  belongs_to :sport
  has_many :event_teams

  accepts_nested_attributes_for :event_teams

  validates :event_teams, length: { maximum: 2 }
  validates :start_at, presence: true
  validates :finish_at, presence: true

end

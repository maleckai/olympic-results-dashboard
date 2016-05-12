class Event < ApplicationRecord
  belongs_to :sport
  has_many :event_teams

  accepts_nested_attributes_for :event_teams

  validates :event_teams, length: { maximum: 2 }
  validates :start_at, presence: true
  validates :finish_at, presence: true

  default_scope { order('start_at ASC') }
  scope :upcoming, -> { where('start_at > ?', DateTime.now) }
  scope :in_progress, -> { where('start_at < ? AND finish_at > ?', DateTime.now, DateTime.now) }
  scope :for_sport, ->(sport_id) { where(sport_id: sport_id) }

end

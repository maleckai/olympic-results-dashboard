class Event < ActiveRecord::Base

  validates :start_at, presence: true
  validates :finish_at, presence: true

end

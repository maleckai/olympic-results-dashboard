class EventTeam < ActiveRecord::Base

  validates :score, numericality: { only_integer: true }

end

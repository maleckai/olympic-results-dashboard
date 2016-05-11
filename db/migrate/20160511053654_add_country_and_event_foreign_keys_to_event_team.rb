class AddCountryAndEventForeignKeysToEventTeam < ActiveRecord::Migration
  def change
    add_reference :event_teams, :country, index: true, foreign_key: true
    add_reference :event_teams, :event, index: true, foreign_key: true
  end
end

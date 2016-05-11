class CreateEventTeams < ActiveRecord::Migration
  def change
    create_table :event_teams do |t|
      t.integer :score, default: 0
      t.timestamps null: false
    end
  end
end

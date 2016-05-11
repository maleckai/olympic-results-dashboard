class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_at, null: false
      t.datetime :finish_at, null: false
      t.timestamps null: false
    end
  end
end
